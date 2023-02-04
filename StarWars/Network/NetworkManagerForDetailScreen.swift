//
//  NetworkManagerForDetailScreen.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 03.02.2023.
//

import Foundation

final class NetworkManagerForDetailScreen {
    
    // MARK: - Properties
    static let shared = NetworkManagerForDetailScreen()
    
    // MARK: - Methods
    
    func fetchDetail<T>(url: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url)  { data, response, error in
            if let error = error {
                print("Error returning film : \(error)")
                completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code: \(String(describing: response))")
            return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchPlanet(url: String, completion: @escaping (Result<Planet, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }
    
    func fetchFilm(url: String, completion: @escaping (Result<Film, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }
    
    func fetchStarship(url: String, completion: @escaping (Result<Starship, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }
    
    func fetchSpecies(url: String, completion: @escaping (Result<Species, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }

    func fetchVehicle(url: String, completion: @escaping (Result<Vehicle, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }
    
    func fetchCharacter(url: String, completion: @escaping (Result<Character, Error>) -> Void) {
        fetchDetail(url: url, completion: completion)
    }
}

