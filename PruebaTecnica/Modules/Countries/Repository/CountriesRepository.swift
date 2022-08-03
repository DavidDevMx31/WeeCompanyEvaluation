//
//  CountriesRepository.swift
//  PruebaTecnica
//
//  Created by David Ali on 03/08/22.
//

import Foundation

protocol CountriesRepository {
    typealias completionHandler = (Result<CountriesResponse, CountriesEndpointError>) -> ()
    func getList(completion: @escaping completionHandler)
}

enum CountriesEndpointError: String, Error {
    case badUrl = "La URL de consulta no es válida"
    case clientError = "Favor de revisar la petición"
    case serverError = "Error en el servidor"
    case invalidMimeType = "La respuesta tiene un MIME no esperado"
    case decodingError = "Ocurrió un error al deserializar la informacion"
}
