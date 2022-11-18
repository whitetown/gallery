//
//  Store.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import Foundation
import Combine

class Store: ObservableObject {

    static let shared = Store()

    @Published var photos = [PhotoItem]()
    @Published var error: Error?

    let api = API()

    func loadPhotos() {
        weak var welf = self
        self.api.loadPhotos { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    welf?.photos = photos
                case .failure(let error):
                    welf?.error = error
                }
            }
        }
    }
}
