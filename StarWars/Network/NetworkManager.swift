//
//  FilmsNetworkManager.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import Foundation

final class NetworkManager {
    // MARK: - Properties

    private var allObjects: [ParsingModel] = []

    // MARK: - Methods
    
    func fetchCategories(url: String, completionHandler: @escaping ([ParsingModel]?) -> Void) {

        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        print(url)
        let session = URLSession.shared

        DispatchQueue.global().async {

            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in

                if let error = error {
                print("Error with fetching : \(error)")
                return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                return
                }

                guard let data = data, let summary = try? JSONDecoder().decode(ParsingModelSummary.self, from: data) else { return }
                completionHandler(summary.results ?? [])
                print(summary.count)
            })

             task.resume()
        }
     }

    func fetchDetail(withID id:Int, url: String, completionHandler: @escaping (ParsingModel) -> Void) {
        guard let url = URL(string: url + "\(id)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
        print("Error returning film id \(id): \(error)")
        return
        }

        guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
            print("Unexpected response status code: \(String(describing: response))")
        return
        }

        if let data = data,
        let detailInfo = try? JSONDecoder().decode(ParsingModel.self, from: data) {
            completionHandler(detailInfo)
        }
    }
        task.resume()
    }
 }
