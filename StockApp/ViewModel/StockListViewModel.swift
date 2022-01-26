//
//  StockListViewModel.swift
//  StockApp
//
//  Created by Gaurav Singh on 16/01/22.
//

import Foundation
import RxCocoa
import RxSwift

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(callback: @escaping (T) -> Void) {
        self.listener = callback
    }
    
    init(_ value: T) {
        self.value = value
    }
    
}


struct StockListViewModel{

    var stocks = PublishSubject<[StockViewModel]>()

    var list: Dynamic<[StockViewModel]> = Dynamic([])
    
    func `init`(){
        fetchStocks()
    }
    
    private func fetchStocks(){
        
        Webservice().getStocks { stocks in
            
            if let stockList = stocks{
                
                let arrayViewModel = stockList.map(StockViewModel.init)
                
                self.list.value = arrayViewModel
                self.stocks.onNext(arrayViewModel)
                self.stocks.onCompleted()
                
               
            }
            
        }
    }
    
    
    
}




