//
//  Webservice.swift
//  Ransom
//
//  Created by Gaurav Singh on 11/01/22.
//

import Foundation

class Webservice{
    
    func getStocks(completion: @escaping (([Stock]?)-> Void)){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response , error in
            
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
        
            do {
                let stocks = try JSONDecoder().decode([Stock].self, from: data)
                completion(stocks)
            } catch {
                print(error)
                completion(nil)
            }
            
            
        }.resume()
        
    }
        
}
