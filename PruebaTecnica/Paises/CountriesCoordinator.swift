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
        countriesVC.onCountryCellTap = showSelectedCountry(_:)
        countriesVC.onError = showError(message:)
        navigate(to: countriesVC, with: .push, animated: false)
    }
    
    private func showSelectedCountry(_ countryName: String) -> () {
        let selectedCountryVC = SelectedViewController()
        selectedCountryVC.paisSeleccionado = countryName
        navigate(to: selectedCountryVC, with: .sheet)
    }
    
    private func showError(message: String) -> () {
        let alertController = UIAlertController(title: "Ocurrió un error al consultar la información", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        navigate(to: alertController, with: .present)
    }
}
