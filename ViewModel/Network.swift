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
    
    init(details: Details, results: Results) {
        self.details = details
        self.results = results
    }
    
    
    func fetchResults() async {
            print("fetching list data")
        
            do {
                let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=721")!
                let (results, _) = try await URLSession.shared.data(from: url)
                print("Results:")
                print(String(decoding: results, as: UTF8.self))
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
           
                if let decodedResults = try? decoder.decode(Results.self, from: results) {
                    DispatchQueue.main.async {
                        self.results = decodedResults
                    }
                    await self.fetchDetails(result: self.results.results[1])
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    
    func fetchPokemon() {
        Task {
            await fetchResults()
            await fetchDetails(result: self.results.results[1])
        }
    }
    
    func fetchDetails(result: Result) async {
        guard let url = URL(string: result.url) else { fatalError("Missing URL") }

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
                        let decodedDetails = try  decoder.decode(Details.self, from: data)
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
