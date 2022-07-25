//
//  AppCoordinator.swift
//  PruebaTecnica
//
//  Created by David Ali on 25/07/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    private var window: UIWindow
    
    internal var navigationController: UINavigationController
    internal var childCoordinators: [CoordinatorKeys : Coordinator]
    
    public var rootViewController: UIViewController {
        return navigationController
    }
    
    init(with window: UIWindow) {
        self.childCoordinators = [:]
        self.navigationController = UINavigationController()
        self.window = window
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        let countriesCoordinator = CountriesCoordinator(with: self.navigationController)
        addChild(countriesCoordinator, with: .Countries)
    }
    
}
