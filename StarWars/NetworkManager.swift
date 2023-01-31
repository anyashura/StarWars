//
//  NetworkManager.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

// import Foundation
//
// private let url = "https://swapi.dev/api/"
//
// class NetworkManager {
//    func testGetRequest() {
//        guard let url = URL(string: url) else { return }
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: url) { data, response, error in
//            print(response)
//            print(data)
//
//            guard let data = data else { return }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(json)
//            } catch {
//                print(error)
//            }
//        }
//
//        task.resume()
//    }

//    private func parse(jsonData: Data) -> Category? {
//        let decoder = JSONDecoder()
//    //    if let response = try? decoder.decode(Response.self, from: jsonData) {
//    //        return response.company
//    //    } else {
//    //        print(NetworkErrors.decodingError)
//    //        return nil
//    //    }
////    }
// }
