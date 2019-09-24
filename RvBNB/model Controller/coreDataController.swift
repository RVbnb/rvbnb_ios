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
                        
                      //  self.updateTasks(with: taskReprentations)
                        
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
        
    }
    
}
