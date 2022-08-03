//
//  PaisesPresenter.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

protocol CountriesView {
    func showPaises()
    func showError(_ message: String)
}

class CountriesPresenter {
    private var view: CountriesView?
    private var paisesRepository: CountriesRepository!
    
    private(set) var paises = [CountryViewModel]()
    
    init(with repository: CountriesRepository) {
        self.paisesRepository = repository
    }
    
    func attachView(_ view: CountriesView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getPaises() {
        paisesRepository.getList { [weak self] response in
            DispatchQueue.main.async {
                switch response {
                case .success(let lista):
                    self?.parseResponseModel(lista)
                    self?.view?.showPaises()
                case .failure(let error):
                    self?.view?.showError(error.rawValue)
                }
            }
        }
    }
    
    private func parseResponseModel(_ response: CountriesResponse) {
        paises.removeAll()
        for pais in response.Lista.Paises {
            paises.append(CountryViewModel(id: pais.idPais, name: pais.Pais))
        }
    }
}
