//
//  FilmsNetworkManager.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import Foundation

final class NetworkManager {

    // MARK: - Methods
    func fetchCategories(url: String, completionHandler: @escaping ([ParsingModel]?) -> Void) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
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
            })

             task.resume()
        }
    }
}
