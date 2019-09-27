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
    
   // init(){   //Networking
    //    fetchUserFromServer()
    //}
    
    //MARK: - properties  //Networking
    //let baseURL = URL(string: "https://rvbnb.herokuapp.com/")!
    //var bearer: Bearer?
    
    //MARK: - CRUD Methods
    @discardableResult func createUser(with username: String, passwword: String, isLandOwner: Bool)-> User {
        
        let user = User(username: username, password: passwword, isLandOwner: isLandOwner, context: CoreDataStack.share.mainContext)
        //registerUser(with: user) //Networking
        CoreDataStack.share.saveToPersistentStore()
        return user
    }
    
    func updateIsLandOwner(for user: User) {
        user.isLandOwner = !user.isLandOwner
        CoreDataStack.share.saveToPersistentStore()
        
    }
    
    func updateUser(user: User, with username: String, password:String) {
        user.username = username
        user.password = password
       // updateUserOnServer(with: [UserRepresentation]) //Networking
        
        CoreDataStack.share.saveToPersistentStore()
    }
    
    func deleteUser(_ user: User){
        CoreDataStack.share.mainContext.delete(user)
        CoreDataStack.share.saveToPersistentStore()
    }
}




               //API Networking methods commented out for Core Data Only
//MARK: - register and Login and update user Methods
//extension ApiController {
//
//     func registerUser(with user: User, completion: @escaping () -> Void = {} )  {
//        let registerURL = baseURL.appendingPathComponent("api/auth/register")
//        var request = URLRequest(url: registerURL)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let encoder = JSONEncoder()
//
//        do {
//            request.httpBody = try encoder.encode(user.userRepresentation)
//        } catch let error {
//            NSLog("error register User: \(error)")
//        }
//
//        URLSession.shared.dataTask(with: request){ (_,response,error)  in
//            if let error = error as NSError? {
//                fatalError("failed to post user: \(error)")
//            }
//            if let response = response as? HTTPURLResponse, response.statusCode != 201 {
//                print(response.statusCode)
//                NSLog("failed to create user")
//                return
//            }
//          completion()
//        }.resume()
//    }
//
//    func Login(with user: User, completion: @escaping() -> Void) {
//        guard let bearer = bearer else {return}
//        let loginURL = baseURL.appendingPathComponent("api/auth/login")
//
//        var request = URLRequest(url: loginURL)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
//
//        let encoder = JSONEncoder()
//
//        do {
//            request.httpBody = try encoder.encode(user.userRepresentation)
//        } catch {
//            NSLog("Error loggin in user: \(error)")
//        }
//        URLSession.shared.dataTask(with: request) { (data,response,error) in
//            if let error = error as NSError? {
//                NSLog("error logging in user: \(error)")
//                return
//            }
//            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
//                print(response.statusCode)
//                return
//            }
//
//            guard let data = data else {return}
//            let decoder = JSONDecoder()
//
//            do {
//                let bearer = try decoder.decode(Bearer.self, from: data)
//                self.bearer = bearer
//            } catch let error {
//                NSLog("error decoding user info: \(error)")
//            }
//        }.resume()
//
//    }
//
//
//
//
//    func fetchUserFromServer(completion: @escaping()-> Void = {}) {
//
//
//        //Apending path component adds a forward slash where as appending path extension adds period
//        let requestURL = baseURL.appendingPathExtension("json")
//
//        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
//
//            if let error = error{
//                NSLog("error fetching tasks: \(error)")
//                completion()
//            }
//
//            guard let data = data else{
//                NSLog("Error getting data task:")
//                completion()
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//
//                //Gives us full array of task representation
//                let taskRepresentations = Array(try decoder.decode([String: UserRepresentation].self, from: data).values)
//
//                self.updateUserOnServer(with: taskRepresentations)
//
//
//
//            } catch {
//                NSLog("Error decoding: \(error)")
//
//            }
//
//            }.resume()
//
//
//    }
//
//
//
//
//
//
//
//
//    func updateUserOnServer(with representation: [UserRepresentation]){
//
//
//        let identifiersToFetch = representation.compactMap({$0.username})
//
//        let representationByID = Dictionary(uniqueKeysWithValues: zip(identifiersToFetch, representation))
//
//        //Make a mutable copy of Dictionary above
//        var tasksToCreate = representationByID
//
//
//        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
//        context.performAndWait {
//
//
//            do {
//                let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//                 fetchRequest.predicate = NSPredicate(format: "identifier IN %@", identifiersToFetch)
//
//
//                let exisitingUser = try context.fetch(fetchRequest)
//
//
//                for user in exisitingUser {
//                  guard let username = user.username,
//                    let representation = representationByID[username] else{return}
//
//                    user.username = representation.username
//                    user.password = representation.password
//                    user.isLandOwner = representation.isLandOwner
//
//                    tasksToCreate.removeValue(forKey: username)
//
//
//                }
//
//                for representation in tasksToCreate.values{
//                    User(userRepresentation: representation, context: context)
//                }
//
//                CoreDataStack.shared.mainContext.saveChanges(context: context)
//
//            } catch {
//                NSLog("Error fetching tasks from persistent store: \(error)")
//            }
//        }
//    }
//
//
//
//}
//
////MARK: - get and post listings
//extension ApiController {
//
//    func updateListings(with listing: [ListingRepresentation]){
//        let id = listing.compactMap({$0.ownerID})
//        let listingID = Dictionary(uniqueKeysWithValues: zip(id, listing))
//        var listingsCopy = listingID
//        let context = CoreDataStack.shared.mainContext
//        do {
//            let fetchRequest: NSFetchRequest<Listing> = Listing.fetchRequest()
//            let existingListing = try context.fetch(fetchRequest)
//            for listing in existingListing {
//
//              let id = Int(listing.ownerID)
//              guard  let idRepresentation = listingID[id] else {return}
//
//                listing.landDescription = idRepresentation.landDescription
//                listing.landPhoto = idRepresentation.landPhoto
//                listing.location = idRepresentation.location
//                listing.pricePerDay = idRepresentation.pricePerDay
//                listing.ownerID = Int64(idRepresentation.ownerID)
//                listingsCopy.removeValue(forKey: id)
//
//                for listingRepresentation in listingsCopy.values {
//                    Listing(listingRepresentation: listingRepresentation, context: context)
//                }
//            }
//            CoreDataStack.shared.mainContext.saveChanges()
//        } catch {
//            NSLog("failed to update Listings: \(error)")
//        }
//
//    }
//    func postListing() {}
//
//
//    func getListings(completion: @escaping(Result<[String],NetworkError>) -> Void ) {
//        guard let bearer = bearer else {
//            completion(.failure(.noToken))
//            return
//        }
//
//        let listingURl = baseURL.appendingPathComponent("/api/listings")
//        var request = URLRequest(url: listingURl)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("bearer: \(bearer.token)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request){ (data,response,error) in
//            guard let data = data else {
//                completion(.failure(.noData))
//                return }
//
//            if let error = error as NSError? {
//                completion(.failure(.otherError(error)))
//                return
//            }
//            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
//                completion(.failure(.responseError))
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let listings = try decoder.decode([String].self, from: data)
//                completion(.success(listings))
//            } catch {
//                NSLog("error decoding data: \(error)")
//                completion(.failure(.noDecode))
//                return
//            }
//        }.resume()
//    }
//}
