//
//  String.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import Foundation

extension String {

    public var unlocalized: String {
        self
    }

    public var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
