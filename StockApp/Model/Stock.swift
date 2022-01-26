//
//  Stock.swift
//  StockApp
//
//  Created by Gaurav Singh on 16/01/22.
//

import Foundation

struct Stock: Decodable{
    
    let symbol: String
    let description: String
    let price: Int
    let change: String
    
}
