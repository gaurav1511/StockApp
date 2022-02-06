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
    
    
    func load(){
        fetchStocks()
    }
    
    private func fetchStocks(){
        
        
        Webservice().request(url: Constant.stockUrl, expecting: [Stock].self) { result in
            
            switch result {
                
            case .success(let result):
                let arrayViewModel = result.map(StockViewModel.init)
                self.stocks.onNext(arrayViewModel)
                self.stocks.onCompleted()
                
            case .failure(let error):
                debugPrint(error)
                break
                
            }
            
        }
        
    }
    
    
    
}




