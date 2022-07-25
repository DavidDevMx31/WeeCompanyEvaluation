//
//  Coordinator.swift
//  PruebaTecnica
//
//  Created by David Ali on 25/07/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [CoordinatorKeys:Coordinator] { get set }
    
    func start()
    func addChild(_ coordinator: Coordinator, with key: CoordinatorKeys)
    func removeChild(_ coordinator: Coordinator)
}

extension Coordinator {
    
    func addChild(_ coordinator: Coordinator, with key: CoordinatorKeys) {
        childCoordinators[key] = coordinator
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.value !== coordinator })
    }
    
}

extension Coordinator {
    
    func navigate(to viewController: UIViewController, with presentationStyle: NavigationStyles, animated: Bool = true) {
        switch presentationStyle {
        case .present:
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
}
