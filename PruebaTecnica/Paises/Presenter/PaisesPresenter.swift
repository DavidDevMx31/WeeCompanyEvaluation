//
//  PaisesPresenter.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

protocol PaisesView {
    func showPaises()
    func showError(_ message: String)
}

class PaisesPresenter {
    private var view: PaisesView?
    private var paisesService = PaisesService()
    
    private(set) var paises = [PaisViewModel]()
    
    func attachView(_ view: PaisesView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getPaises() {
        paisesService.getList { [weak self] response in
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
    
    private func parseResponseModel(_ response: PaisesResponse) {
        paises.removeAll()
        for pais in response.Lista.Paises {
            paises.append(PaisViewModel(id: pais.idPais, name: pais.Pais))
        }
    }
}
