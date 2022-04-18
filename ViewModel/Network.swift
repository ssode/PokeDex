//
//  Network.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI

class Network: ObservableObject {
    @Published var details: Details
    @Published var results: Results
    @Published var speciesDetail: SpeciesDetail
    @Published var evolution: Evolution
    
    init(details: Details, results: Results, speciesDetail: SpeciesDetail, evolution: Evolution) {
        self.details = details
        self.results = results
        self.speciesDetail = speciesDetail
        self.evolution = evolution
    }
    
//    func fetchResults() {
//        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=121")!
//        let urlRequest = URLRequest(url: url)
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
//                        let decodedResults = try decoder.decode(Results.self, from: data)
//                        self.results = decodedResults
//                    } catch let error {
//                        print("error decoding:", error)
//                    }
//                }
//            }
//        }
//         dataTask.resume()
//    }
    
    
    func fetchPokemon() {
        Task {
            await fetchResults()
        }
    }
    
    func fetchResults() async {
            print("fetching list data")
            do {
                let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=121")!
                let (results, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                if let decodedResults = try? decoder.decode(Results.self, from: results) {
                    DispatchQueue.main.async {
                        self.results = decodedResults
                    }
                    await self.fetchDetails(results: self.results.results)
                }
            } catch {
                print(error.localizedDescription)
            }
        }



    func fetchDetails(results: [Result]) async {
        for urls in results {
            guard let url = URL(string: urls.url) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error:", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedDetails = try decoder.decode(Details.self, from: data)
                        self.details = decodedDetails
                    } catch let error {
                        print("error decoding:", error)
                    }
                }
            }
        }
         dataTask.resume()
        }
    }
    
    func fetchDetails(url: Result) {
        guard let url = URL(string: url.url) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error:", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedDetails = try decoder.decode(Details.self, from: data)
                        self.details = decodedDetails
                    } catch let error {
                        print("error decoding:", error)
                    }
                }
            }
        }
         dataTask.resume()
    }
    
    func fetchSpecies(url: Species) {
        guard let url = URL(string: url.url) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error:", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        print("Results:")
                        print(String(decoding: data, as: UTF8.self))
                        print("end results")
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedSpeciesDetail = try decoder.decode(SpeciesDetail.self, from: data)
                        self.speciesDetail = decodedSpeciesDetail
                        
                    } catch let error {
                        print("error decoding:", error)
                    }
                }
            }
        }
         dataTask.resume()
    }
    
    
    func fetchEvolution(url: SpeciesDetail)  {
        guard let url = URL(string: url.evolutionChain.url) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error:", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        print("Results:")
                        print(String(decoding: data, as: UTF8.self))
                        print("end results")
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedEvolution = try decoder.decode(Evolution.self, from: data)
                        self.evolution = decodedEvolution
                    } catch let error {
                        print("error decoding:", error)
                    }
                }
            }
        }
         dataTask.resume()
    }
}
