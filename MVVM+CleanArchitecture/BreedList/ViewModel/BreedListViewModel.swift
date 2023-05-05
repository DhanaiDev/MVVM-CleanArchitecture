//
//  File.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import Foundation
import Combine

final class BreedListViewModel: ObservableObject {
    
    enum ViewState {
        case loading
        case loaded(BreedList)
        case failed(Error)
    }
    
    @Published var viewState: ViewState = .loading
    
    private var cancellable: Set<AnyCancellable> = []
    
    func fetchBreedList() {
        self.viewState = .loading
        fetchBreedListFromServer()
    }
}

private extension BreedListViewModel {
    func fetchBreedListFromServer() {
        BreedListUseCase().getBreedList()
            .sink { result in
            switch result {
            case .finished:
                print("BreedList fetched Successfully")
            case .failure(let error):
                self.viewState = .failed(error)
            }
        } receiveValue: { [weak self] breedList in
            guard let self else { return }
            self.viewState = .loaded(breedList)
        }
        .store(in: &cancellable)
    }
}
