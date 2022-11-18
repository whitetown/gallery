//
//  BaseTableViewController.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

class BaseTableViewController: BaseViewController {

    let tableView: UITableView

    init(style: UITableView.Style = .plain) {
        self.tableView = UITableView(frame: .zero, style: style)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
    }

}

private extension BaseTableViewController {

    func addTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(UITableViewCell.self)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension BaseTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeue(for: indexPath)
    }
}
