//
//  Webservice.swift
//  Ransom
//
//  Created by Gaurav Singh on 11/01/22.
//

import Foundation
import RxSwift



class Webservice{
    
    
    func request <T:Codable> (url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>)-> Void){
        
        guard let url = url else{
            completion(.failure(NetworkError.invalidUrl))
            return
        }
         URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                if let error = error{
                    completion(.failure(error))
                }
                else{
                    completion(.failure(NetworkError.case400))
                }
                return
            }
            
            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
            
         }.resume()
        
        
    }
    
        
}


struct Constant {
    static let stockUrl = URL(string: "https://island-bramble.glitch.me/stocks")
}

enum NetworkError: Error{
    
    case invalidUrl
    case case400
    case case401
    
}
