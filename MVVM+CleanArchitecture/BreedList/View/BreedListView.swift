//
//  BreedListView.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import SwiftUI

struct BreedListView: View {
    
    @StateObject var viewModel = BreedListViewModel()
    
    var body: some View {
        switch viewModel.viewState {
        case .loading:
            ProgressView("Title").scaledToFit().onAppear {
                viewModel.fetchBreedList()
            }
        case .loaded(let list):
            List{
                ForEach(list.names) { name in
                    Text(name.name).bold()
                }
            }
        case .failed(let error):
            Text(error.localizedDescription)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
