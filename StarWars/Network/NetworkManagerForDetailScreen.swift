//
//  NetworkManagerForDetailScreen.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 03.02.2023.
//

import Foundation

final class NetworManagerForDetailScreen {

    // MARK: - Methods
    func fetchDetail(url: String, completionHandler: @escaping (DetailParsingModel?) -> Void) {

        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                if let error = error {
                    print("Error returning film : \(error)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Unexpected response status code: \(String(describing: response))")
                return
                }

                guard let data = data else { return }
                if let detailInfo = try? JSONDecoder().decode(DetailParsingModel?.self, from: data) {
                    completionHandler(detailInfo)
                }
            }

            task.resume()
        }
    }
}
