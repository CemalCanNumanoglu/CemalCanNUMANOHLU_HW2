//
//  ViewController.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listViewModel: ListViewModelProtocol! {
        didSet {
            listViewModel.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        tableView.register(cellType: ListTableViewCell.self)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: ListTableViewCell.self, indexPath: indexPath)
        if let news = self.listViewModel.news(indexPath.row){
            cell.configure(news: news)
        }
        if let media = self.listViewModel.media(indexPath.row) {
            cell.configureMedia(media: media)
        }
        return cell
    }
    
}


extension ViewController: ListViewModelDelegate, LoadingShowable {
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
}

