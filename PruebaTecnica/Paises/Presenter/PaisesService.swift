//
//  PaisesService.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import Foundation

enum PaisesEndpointError: String, Error {
    case badUrl = "La URL de consulta no es valida"
    case clientError = "Favor de revisar la petición"
    case serverError = "Error en el servidor"
    case invalidMimeType = "La respuesta tiene un MIME no esperado"
    case decodingError = "Ocurrió un error al deserializar la informacion"
}

class PaisesService {
    private let session = URLSession.shared
    private let paisesEndpoint = "https://weepatient.com/API/api/Utilidades/Pais_GetPais"
    
    typealias completionHandler = (Result<PaisesResponse, PaisesEndpointError>) -> Void
    
    func getList(completion: @escaping completionHandler) {
        guard let urlEndpoint = URL(string: paisesEndpoint)  else { fatalError("La URL no tiene un formato válido") }
        var request = URLRequest(url: urlEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let requestData = getRequestBody()
        
        let task = session.uploadTask(with: request, from: requestData) { data, response, error in
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
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let lista = try decoder.decode(PaisesResponse.self, from: responseData)
                print("Países encontrados: \(lista.NoFilas)")
                completion(.success(lista))
            } catch {
                completion(.failure(.decodingError))
                print("Error en la deserializacion \(String(describing: error))")
            }
        }
        task.resume()
    }
        private func getRequestBody() -> Data {
        let requestBody = """
            { "cadena": "" }
            """
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(requestBody)
            return data
        } catch  {
            fatalError("No se pudo procesar el cuerpo de la petición")
        }
    }
}
