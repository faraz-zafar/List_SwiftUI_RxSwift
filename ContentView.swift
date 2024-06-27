//
//  ContentView.swift
//  List_SwiftUI_RxSwift
//
//  Created by FAr Az on 27.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CitySearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                List(viewModel.filteredCities, id: \.self) { city in
                    NavigationLink(destination: Text(city)) {
                        Text(city)
                    }
                }
            }
            .navigationTitle("City Search")
        }
    }
}

#Preview {
    ContentView()
}
