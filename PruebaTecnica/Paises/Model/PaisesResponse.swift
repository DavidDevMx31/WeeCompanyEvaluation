//
//  PaisesResponse.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

struct PaisesResponse: Codable {
    let NoFilas: Int
    let Lista: PaisModel
    
    struct PaisModel: Codable {
        let Paises: [Pais]
    }
    
    struct Pais: Codable {
        let idPais: String
        let Pais: String
    }
    
    enum CodingKeys: String, CodingKey {
        case NoFilas
        case Lista = "dsRespuesta"
    }
}
