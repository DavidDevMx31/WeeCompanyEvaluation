//
//  CountriesCoordinator.swift
//  PruebaTecnica
//
//  Created by David Ali on 25/07/22.
//

import Foundation
import UIKit

class CountriesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorKeys : Coordinator]
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [:]
        
        start()
    }
    
    func start() {
        let countriesVC = PaisesViewController()
        navigate(to: countriesVC, with: .push, animated: false)
    }
    
}
