//
//  APIClient.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import Foundation
import Combine

final class APIClient <T: Decodable> {
    
    func getResult(for url: URL) -> AnyPublisher<T, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
