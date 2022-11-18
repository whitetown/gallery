//
//  API.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import Foundation

class API {

    func loadPhotos(_ completion: @escaping (Result<[PhotoItem], Error>)->Void) {

        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in

                if let error = error {
                    completion(.failure(error))
                }

                if  let data = data,
                    let result = try? JSONDecoder().decode([PhotoItem].self, from: data) {
                    completion(.success(result))
                }

                completion(.failure(ParsingError()))
            }
            task.resume()

        }
    }

}

class ParsingError: Error {
    var localizedDescription: String {
        "Parsing error"
    }
}
