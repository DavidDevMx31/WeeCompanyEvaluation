//
//  CountriesResponse.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

struct CountriesResponse: Codable {
    let NoFilas: Int
    let Lista: Countries
    
    struct Countries: Codable {
        let Paises: [Country]
    }
    
    struct Country: Codable {
        let idPais: String
        let Pais: String
    }
    
    enum CodingKeys: String, CodingKey {
        case NoFilas
        case Lista = "dsRespuesta"
    }
}
