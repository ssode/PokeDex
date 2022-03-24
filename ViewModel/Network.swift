//
//  Network.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI
import Combine

class Network: ObservableObject {
    @Published var details: Details
    @Published var results = Results(results: [])
    
    init(details: Details) {
        self.details = details
    }
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T) -> AnyPublisher<T, Never> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
//    func fetchResults(url: String) {
//        guard let url = URL(string: url) else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("request error:", error)
//                return
//            }
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let decodedPokemon = try  decoder.decode(PokeList.self, from: data)
//                        self.pokeList = decodedPokemon
//                    } catch let error {
//                        print("error decoding:", error)
//                    }
//                }
//            }
//        }
//         dataTask.resume()
//    }
}

