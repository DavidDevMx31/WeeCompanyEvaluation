//
//  PaisModel.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

struct PaisViewModel {
    let id: String
    let name: String
    var displayName: String { id + " - " + name }
}
