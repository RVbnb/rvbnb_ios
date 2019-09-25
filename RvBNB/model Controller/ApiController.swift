//
//  ApiController.swift
//  RvBNB
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

import CoreData

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case encodingError
    case responseError
    case otherError(Error)
    case noData
    case noDecode
    case noToken
}


class ApiController {
    
    //MARK: - properties
    let baseURL = URL(string: "https://rvbnb.herokuapp.com/")!
    var bearer: Bearer?
    
    //MARK: - CRUD Methods
    func CreateUser(withUserName username: String, passwword: String, isLandOwner: Bool)-> User {
        let user = User(username: username, password: passwword, isLandOwner: isLandOwner, context: CoreDataStack.shared.mainContext)
        registerUser(with: user)
        CoreDataStack.shared.mainContext.saveChanges()
        return user
    }
    
    func updateIsLandOwner(for user: User) {
        user.isLandOwner = !user.isLandOwner
        updateUserOnServer(with: user)
        CoreDataStack.shared.mainContext.saveChanges()
        
    }
    
    func updateUser(_ user: User, username: String, password:String) {
        user.username = username
        user.password = password
        CoreDataStack.shared.mainContext.saveChanges()
    }
    
    func deleteUser(_ user: User){
        CoreDataStack.shared.mainContext.delete(user)
        CoreDataStack.shared.mainContext.saveChanges()
    }
}

//MARK: - register and Login and update user Methods
extension ApiController {
    
     func registerUser(with user: User, completion: @escaping () -> Void = {} )  {
        let registerURL = baseURL.appendingPathComponent("/api/auth/register")
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        let encoder = JSONEncoder()
        
        do {
            request.httpBody = try encoder.encode(user.userRepresentation)
        } catch let error {
            NSLog("error register User: \(error)")
        }
        
        URLSession.shared.dataTask(with: request){ (_,response,error)  in
            if let error = error as NSError? {
                fatalError("failed to post user: \(error)")
            }
            if let response = response as? HTTPURLResponse, response.statusCode != 201 {
                NSLog("failed to create user")
                return
            }
        
        }.resume()
    }
  
    func Login(with user: User, completion: @escaping() -> Void) {
        guard let bearer = bearer else {return}
        let loginURL = baseURL.appendingPathComponent("/api/auth/login")
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("bearer: \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        let encoder = JSONEncoder()
        
        do {
            request.httpBody = try encoder.encode(user.userRepresentation)
        } catch {
            NSLog("Error loggin in user: \(error)")
        }
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let error = error as NSError? {
                NSLog("error logging in user: \(error)")
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                return
            }
        
            guard let data = data else {return}
            let decoder = JSONDecoder()
            
            do {
                let bearer = try decoder.decode(Bearer.self, from: data)
                self.bearer = bearer
            } catch let error {
                NSLog("error decoding user info: \(error)")
            }
        }.resume()
    
    }
    
    func updateUserOnServer(with user: User, completion: @escaping() -> Void = {}) {
        
    }
    
}

//MARK: - get and post listings
extension ApiController {
    
    func updateListings(with listing: [ListingRepresentation]){
        let id = listing.compactMap({$0.ownerID})
        let listingID = Dictionary(uniqueKeysWithValues: zip(id, listing))
        var listingsCopy = listingID
        let context = CoreDataStack.shared.mainContext
        do {
            let fetchRequest: NSFetchRequest<Listing> = Listing.fetchRequest()
            let existingListing = try context.fetch(fetchRequest)
            for listing in existingListing {
                
              let id = Int(listing.ownerID)
              guard  let idRepresentation = listingID[id] else {return}
                 
                listing.landDescription = idRepresentation.landDescription
                listing.landPhoto = idRepresentation.landPhoto
                listing.location = idRepresentation.location
                listing.pricePerDay = idRepresentation.pricePerDay
                listing.ownerID = Int64(idRepresentation.ownerID)
                listingsCopy.removeValue(forKey: id)
                
                for listingRepresentation in listingsCopy.values {
                    Listing(listingRepresentation: listingRepresentation, context: context)
                }
            }
            CoreDataStack.shared.mainContext.saveChanges()
        } catch {
            NSLog("failed to update Listings: \(error)")
        }
        
    }
    func postListing() {}
    
    
    
    
    
    func getListings(completion: @escaping(Result<[String],NetworkError>) -> Void ) {
        guard let bearer = bearer else {
            completion(.failure(.noToken))
            return
        }
        
        let listingURl = baseURL.appendingPathComponent("/api/listings")
        var request = URLRequest(url: listingURl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("bearer: \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            guard let data = data else {
                completion(.failure(.noData))
                return }
            
            if let error = error as NSError? {
                completion(.failure(.otherError(error)))
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(.responseError))
            }
            
            do {
                let decoder = JSONDecoder()
                let listings = try decoder.decode([String].self, from: data)
                completion(.success(listings))
            } catch {
                NSLog("error decoding data: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
}
