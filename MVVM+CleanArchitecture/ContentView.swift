//
//  ContentView.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let testAPI = ToTestAPI()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! Test")
        }
        .onTapGesture {
             testAPI.test()
        }
        .padding()
    }
}

class ToTestAPI {
    
    var cancellable: Set<AnyCancellable> = []
    var testPublisher: AnyPublisher<BreedList, Error> = BreedListAPI().getBreedList()
    func test() {
        
        BreedListUseCase().getBreedList()
            .sink { result in
            print(result)
        } receiveValue: { value in
            print(value)
        }
        .store(in: &cancellable)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
