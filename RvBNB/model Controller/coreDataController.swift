//
//  coreDataController.swift
//  RvBNB
//
//  Created by brian vilchez on 9/24/19.
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

class CoreDataModelController {
    
    //MARK: - Properties
    var baseURL = URL(string: "https://rvbnb.herokuapp.com")!
    var bearer: Bearer? 
    
    //MARK: - initializers
    
    //MARK: - methods
   func registerUser(with username: String, password: String, islandowner: Bool) {
    let user = Register(userName: username, password: password, isLandOwner: islandowner, context: CoreDataStack.shared.mainContext)
        CoreDataStack.shared.mainContext.saveChanges()
        postUser(user: user)
        
    }
    
    func loginUser(with user: Register,completion: @escaping(NetworkError?) -> Void) {
        let loginURL = baseURL.appendingPathComponent("/api/auth/login")
        var request = URLRequest(url: loginURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            request.httpBody = try JSONEncoder().encode(user.registerUserRepresentation)
        } catch {
            NSLog("error logining in user: \(error)")
        }
       URLSession.shared.dataTask(with: request) { (data, response, error) in
                  
                  if let response = response as? HTTPURLResponse,
                      response.statusCode != 200 {
                      completion(.responseError)
                      return
                  }
                  
                  if let error = error {
                      NSLog("Error logging in: \(error)")
                      completion(.otherError(error))
                      return
                  }
                  
                  
                  guard let data = data else {
                      completion(.noData)
                      return
                  }
                  
                  do {
                      let bearer = try JSONDecoder().decode(Bearer.self, from: data)
                      self.bearer = bearer
                  } catch {
                      completion(.noDecode)
                      return
                  }
                  completion(nil)
              }.resume()
    }
}

//MARK: -  creating user and fetching user methods
extension CoreDataModelController {
    
    
     private func fetchUser(completion: @escaping (NetworkError?) -> Void ) {
         let requestURL = baseURL.appendingPathExtension("json")
                
                URLSession.shared.dataTask(with: requestURL) { (data, response, error) in

                    if let response = response as? HTTPURLResponse,
                        response.statusCode != 200 {
                        completion(.responseError)
                        return
                    }
                    if let error = error {
                        NSLog("Error fetching user: \(error)")
                        completion(.noData)
                    }
                    
                    guard let data = data else {
                        NSLog("No data returned")
                        completion(.noData)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let registerUserReprentations = try decoder.decode([String: RegisterUserRepresentation].self, from: data).map({ $0.value })
                        
                        
                       self.updateUser(with: registerUserReprentations)
                        
                    } catch {
                        NSLog("Error decoding: \(error)")
                    }
                    
                }.resume()
     }
     
     private func postUser(user: Register, completion: @escaping () -> Void = {}) {
     let requestURL = baseURL
         requestURL.appendingPathComponent("/api/auth/register").appendingPathExtension("json")
     
     
     var request = URLRequest(url: requestURL)
     request.httpMethod = HTTPMethod.post.rawValue
     
     guard let  registerUserRepresentation = user.registerUserRepresentation else {
         NSLog("user does not exist")
         completion()
         return
         }
         
     do {
         request.httpBody = try JSONEncoder().encode(registerUserRepresentation)
     }catch let error {
         NSLog("error encoding user: \(error)")
     }
         
         URLSession.shared.dataTask(with: request) {  (_, _, error) in
                    
                    if let error = error {
                        NSLog("Error posting task: \(error)")
                        completion()
                        return
                    }
                    
                    completion()
                }.resume()
     }
     
}

//MARK: - getting and posting land listing methods
extension CoreDataModelController {
    
    func getListing(completion: @escaping(Result<[String],NetworkError>) -> Void) {
        
        guard let bearer = bearer else {
            completion(.failure(.noToken))
            return
        }
        
        
        let requestURL = baseURL.appendingPathComponent("/api/listings/:id")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        request.setValue("Bearer: \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.failure(.responseError))
                return
            }
            
            if let error = error {
                NSLog("Error getting animal names: \(error)")
                completion(.failure(.otherError(error)))
                return
            }
            
            guard let data = data else{
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
              let listingNames =  try decoder.decode([String].self, from: data)
                completion(.success(listingNames))
            } catch {
                NSLog("Error decoding animals name: \(error)")
                completion(.failure(.noDecode))
                return
            }
        
        }.resume()
        
    }
    
    func postListing(with ownerID: String, completion: @escaping(NetworkError?)-> Void){
        
        let postListingURL = baseURL.appendingPathComponent("/api/listings")
        
        var request = URLRequest(url: postListingURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        do {
           let listingData = try encoder.encode(ownerID)
            request.httpBody = listingData
        } catch {
            NSLog("Error encoding user: \(error)")
            completion(.encodingError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.responseError)
                return
            }
            
            if let error = error{
                NSLog("Error Creating User on Server: \(error)")
                completion(.otherError(error))
                return
            }
            completion(nil)
            
            }.resume() //Resuming the data task
        
        
        
    }
    
    
    func updateListings(with ownerID: String, completion: @escaping(NetworkError?)-> Void){
        
        
        
    }
    
}
