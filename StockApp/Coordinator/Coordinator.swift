//
//  Cordinator.swift
//  StockApp
//
//  Created by Gaurav Singh on 26/01/22.
//

import Foundation
import UIKit
import RxSwift



enum Event{
    case buttonTapped
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}


class MainCoordinator{

    
    
    
}
