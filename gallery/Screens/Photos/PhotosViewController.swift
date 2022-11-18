//
//  PhotosViewController.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit
import Combine

class PhotosViewController: BaseTableViewController {

    private var cancellable: AnyCancellable?
    private var photos = [PhotoItem]()

    deinit {
        removeListeners()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos".unlocalized
        initialize()
        addListeners()
        Store.shared.loadPhotos()
    }

}

private extension PhotosViewController {

    func initialize() {
        self.tableView.registerCell(PhotoCell.self)
    }

    func addListeners() {
        weak var welf = self
        self.cancellable = Store.shared.$photos.sink { photos in
            welf?.photos = photos
            welf?.tableView.reloadData()
        }
    }

    func removeListeners() {
        self.cancellable?.cancel()
    }

    func showDetails(at indexPath: IndexPath) {
        let vc = DetailsViewController(item: self.photos[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension PhotosViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoCell = tableView.dequeue(for: indexPath)
        cell.render(item: self.photos[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetails(at: indexPath)
    }

}
