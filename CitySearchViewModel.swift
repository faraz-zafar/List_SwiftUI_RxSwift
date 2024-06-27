//
//  CitySearchViewModel.swift
//  List_SwiftUI_RxSwift
//
//  Created by FAr Az on 27.06.24.
//

import Foundation
import RxSwift
import RxCocoa

class CitySearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var filteredCities: [String] = []
    
    private let disposeBag = DisposeBag()
    let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose"]

    init() {
        setupBindings()
    }

    private func setupBindings() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [unowned self] query in
                self.cities.filter { $0.lowercased().contains(query.lowercased()) }
            }
            .assign(to: &$filteredCities)
    }
}
