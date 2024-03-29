//
//  CountriesAPIRepository.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

class CountriesAPIRepository: CountriesRepository {
    private let session = URLSession.shared
    private let paisesEndpoint = "https://876ee799-3f5a-4962-8812-a729fd17b274.mock.pstmn.io/paises"
    
    typealias completionHandler = (Result<CountriesResponse, CountriesEndpointError>) -> Void
    
    func getList(completion: @escaping completionHandler) {
        guard let urlEndpoint = URL(string: paisesEndpoint)  else {
            completion(.failure(CountriesEndpointError.badUrl))
            fatalError("La URL no tiene un formato válido")
        }
        var request = URLRequest(url: urlEndpoint)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            //Checamos errores
            if let error = error {
                print("La petición arrojó un error. Mensaje: \(error.localizedDescription)")
                completion(.failure(.clientError))
                return
            }
            
            //Valida el código HTTP de la respuesta
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print("La respuesta devolvió un código de error ")
                completion(.failure(.serverError))
                return
            }
            
            guard let responseData = data else {
                print("Data nil")
                return
            }
            
//            guard let mime = response.mimeType, mime == "application/json" else {
//                print("Wrong MIME type!")
//                return
//            }
            
            do {
                let decoder = JSONDecoder()
                let lista = try decoder.decode(CountriesResponse.self, from: responseData)
                print("Países encontrados: \(lista.NoFilas)")
                completion(.success(lista))
            } catch {
                completion(.failure(.decodingError))
                print("Error en la deserializacion \(String(describing: error))")
            }
        }
        task.resume()
    }
}
