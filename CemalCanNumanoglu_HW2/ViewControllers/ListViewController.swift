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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
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
        
        cell.layer.cornerRadius = 30
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layoutMargins = UIEdgeInsets(top: .zero, left: 30, bottom: 10, right: 30)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Details view' e data aktar
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
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

