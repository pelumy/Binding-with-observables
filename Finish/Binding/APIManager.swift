//
//  APIManager.swift
//  Binding
//
//  Created by Itunu Raimi on 06/06/2022.
//

import Foundation
class APIManager {
    func generateRandomQuote(completion: @escaping (String) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.quotable.io/random") else { return }
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error while generating random quote")
            } else {
                do {
                    let decodedObject = try JSONDecoder().decode(Quote.self, from: data ?? Data())
                    completion(decodedObject.content)
                } catch {
                    print("error decoding", error.localizedDescription)
                }
            }
        }.resume()
    }
}
