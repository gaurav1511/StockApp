//
//  ViewController.swift
//  StockApp
//
//  Created by Gaurav Singh on 15/01/22.
//





import UIKit
import RxSwift

class ViewController: UIViewController {
    
    
     var stockListViewModel = StockListViewModel()
     private var disposeBag = DisposeBag()

    private let tableView: UITableView = {
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        //stockListViewModel.load()
        
        stockListViewModel.list.bind { array in
            debugPrint("array\(array)")
        }
        
    }

    
    func bindTableDataWithRxSwift(){

        stockListViewModel.stocks.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)){ row, model, cell in

            cell.textLabel?.text = model.symbol

        }.disposed(by: disposeBag)


        tableView.rx.modelSelected(StockViewModel.self).bind { stockViewModel in
            debugPrint("\(stockViewModel.description)")

        }.disposed(by: disposeBag)


    }

}

