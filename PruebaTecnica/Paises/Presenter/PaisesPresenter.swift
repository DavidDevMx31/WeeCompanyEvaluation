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
    
    private(set) var paises = [PaisModel]()
    
    func attachView(_ view: PaisesView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getPaises() {
        
    }
}
