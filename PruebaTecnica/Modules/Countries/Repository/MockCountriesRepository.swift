//
//  MockCountriesRepository.swift
//  PruebaTecnica
//
//  Created by David Ali on 03/08/22.
//

import Foundation

class MockCountriesRepository: CountriesRepository {
    
    func getList(completion: @escaping completionHandler) {
        let countries = CountriesResponse.Countries(Paises: [
            CountriesResponse.Country(idPais: "MEX", Pais: "Estados Unidos Mexicanos"),
            CountriesResponse.Country(idPais: "PER", Pais: "República del Perú"),
            CountriesResponse.Country(idPais: "COL", Pais: "República de Colombia"),
            CountriesResponse.Country(idPais: "RSA", Pais: "República de Sudáfrica"),
            CountriesResponse.Country(idPais: "KEN", Pais: "República de Kenia")
        ])
        let response = CountriesResponse(NoFilas: 5, Lista: countries)
        completion(.success(response))
    }
    
}
