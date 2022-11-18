//
//  PhotoItem.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import Foundation

struct PhotoItem: Codable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

extension PhotoItem {

    var thumbURL: URL? {
        URL(string: thumbnailUrl)
    }

    var photoURL: URL? {
        URL(string: url)
    }
}
