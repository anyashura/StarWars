//
//  FilmsNetworkManager.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import Foundation

final class NetworkManager {

    private var allObjects: [ScreenModel] = []
  
    func fetchCategories(url: String, completionHandler: @escaping ([ScreenModel]?) -> Void) {
        
        guard let url = URL(string: url) else { return }
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
                
                guard let data = data, let summary = try? JSONDecoder().decode(ScreenModelSummary.self, from: data) else { return }
                completionHandler(summary.results ?? [])
            })

             task.resume()
        }
     }

//    private func fetchFilm(withID id:Int, completionHandler: @escaping (Film) -> Void) {
//        let url = URL(string: Category.films.url + "\(id)")!
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let error = error {
//        print("Error returning film id \(id): \(error)")
//        return
//        }
//
//        guard let httpResponse = response as? HTTPURLResponse,
//        (200...299).contains(httpResponse.statusCode) else {
//        print("Unexpected response status code: \(response)")
//        return
//        }
//
//        if let data = data,
//        let film = try? JSONDecoder().decode(Film.self, from: data) {
//            completionHandler(film)
//        }
//    }
//        task.resume()
//    }
 }


