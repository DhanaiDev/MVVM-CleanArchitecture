//
//  BreedListAPI.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import Foundation
import Combine

public final class BreedListAPI {
    
    func getBreedList() -> AnyPublisher<BreedList, Error> {
        APIClient().getResult(for: URL(string: "https://dog.ceo/api/breeds/list/all")!)
    }
    
}
