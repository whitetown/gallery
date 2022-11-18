//
//  DetailsViewController.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

class DetailsViewController: BaseViewController {

    private let item: PhotoItem

    private let iv = UIImageView()
    private let label = UILabel()

    init(item: PhotoItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        render()
    }

}

private extension DetailsViewController {

    func initialize() {
        self.iv.contentMode = .scaleAspectFit
        self.view.addSubview(self.iv)
        self.iv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        self.label.numberOfLines = 0
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        self.label.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.readableContentGuide)
        }
    }

    func render() {
        self.label.text = self.item.title
        self.iv.load(url: self.item.photoURL)
    }
}
