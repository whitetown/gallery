//
//  UIImageView.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

extension UIImageView {

    func load(url: URL?, placeholder: UIImage? = UIImage(systemName: "photo")) {
        weak var welf = self
        DispatchQueue.global().async {
            if  let url = url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        welf?.image = image
                    }
            } else {
                DispatchQueue.main.async {
                    self.image = placeholder
                }
            }
        }
    }
}
