//
//  PhotoCell.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit
import SnapKit

class PhotoCell: UITableViewCell {

    private let iv = UIImageView()
    private let title = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {

        self.iv.contentMode = .scaleAspectFill
        self.iv.clipsToBounds = true
        self.iv.layer.cornerRadius = 8
        self.contentView.addSubview(self.iv)
        self.iv.snp.makeConstraints { make in
            make.leading.equalTo(self.readableContentGuide)
            make.top.equalToSuperview().inset(4)
            make.bottom.lessThanOrEqualToSuperview().inset(4).priority(.low)
            make.width.equalTo(80)
            make.height.equalTo(60)
        }

        self.title.numberOfLines = 0
        self.title.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(self.title)
        self.title.snp.makeConstraints { make in
            make.leading.equalTo(self.iv.snp.trailing).offset(8)
            make.trailing.equalTo(self.readableContentGuide)
            make.top.equalToSuperview().inset(4)
            make.bottom.lessThanOrEqualToSuperview().inset(4).priority(.low)
        }
    }

    func render(item: PhotoItem) {
        self.title.text = item.title
        self.iv.load(url: item.thumbURL ?? item.photoURL)
    }


}
