//
//  Networkable.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

protocol Networkable {
    func fetchData<T: Decodable>(endPoint: Endpointable, model: T.Type) async -> Result<T?, Error>
}

extension Networkable {
    func fetchData<T>(endPoint: Endpointable, model: T.Type) async -> Result<T?, Error> where T : Decodable {
        let components = URLComponents(string: endPoint.fullPath)
        
        guard let url = components?.url else {
            return .failure( NSError(domain: "InvalidURL", code: 0))
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NSError(domain: "No response from service", code: 1))
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(model, from: data) else {
                    return .failure(NSError(domain: "Data cannot be decoded", code: 2))
                }
                return .success(decodedResponse)
            case 401:
                return .failure(NSError(domain: "Unauthorized", code: 3))
            default:
                return .failure(NSError(domain: "Unknown Error", code: 4))
            }
        }catch {
            return .failure(NSError(domain: "Unknown Error", code: 5))
        }
    }
}
