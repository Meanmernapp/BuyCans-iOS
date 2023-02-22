//
//  ApiClient.swift
//  Buy Cans
//
//  Created by Shoaib Hassan on 22/02/2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}

class Networkhandler {
    
    class var shared : Networkhandler {
        struct Static {
            static let instance : Networkhandler = Networkhandler()
        }
        return Static.instance
    }
    var numberOfList = 10
    let fetchAllUsers = "https://jsonplaceholder.typicode.com/users"
    func ApiBearCall(_ url : String = "https://api.punkapi.com/v2/beers",completion: @escaping( ([CansModel]?, APIError?) -> Void)) {
        let urlForBeer = url + "?per_page=\(self.numberOfList)"
        AF.request(urlForBeer).validate().response(completionHandler: { data in
        switch data.result {
        case .success:
            if let value = data.data {
                let decoder = JSONDecoder()
                do {
                    let cans = try decoder.decode([CansModel].self, from: value)
                    completion(cans, nil)
                }
                catch {
                    completion(nil, APIError.internalError)
                }
                
            }
        case .failure(let error):
            print(error)
        }
    })
        
    }
    
    func ApiUserCall(completion: @escaping( ([UserModel]?, APIError?) -> Void)) {
        AF.request(fetchAllUsers).validate().response(completionHandler: { data in
        switch data.result {
        case .success:
            if let value = data.data {
                let decoder = JSONDecoder()
                do {
                    let user = try decoder.decode([UserModel].self, from: value)
                    completion(user, nil)
                }
                catch {
                    completion(nil, APIError.internalError)
                }
                
            }
        case .failure(let error):
            print(error)
        }
    })
        
    }
    
    
}
