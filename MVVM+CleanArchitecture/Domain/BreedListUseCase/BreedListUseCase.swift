//
//  BreedListUseCase.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import Foundation
import Combine

final class BreedListUseCase {
    
    func getBreedList() -> AnyPublisher<BreedList, Error> {
        return BreedListAPI().getBreedList()
    }
}
