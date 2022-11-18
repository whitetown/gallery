//
//  UITableViewCell.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

extension UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    static func dequeue<T: UITableViewCell>(from tableView: UITableView, for indexPath: IndexPath) -> T {
        let result = tableView.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        return result as? T ?? T()
    }

}
