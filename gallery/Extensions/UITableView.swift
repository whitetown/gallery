//
//  UITableView.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

extension UITableView {

    func registerCell<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let result = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        return result as? T ?? T()
    }
}
