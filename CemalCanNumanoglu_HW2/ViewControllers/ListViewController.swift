//
//  ViewController.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import UIKit
//MARK: ListViewController
class ListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listViewModel: ListViewModelProtocol! {
        didSet {
            listViewModel.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fetchData()
        self.tabBarController?.navigationItem.title = "News"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        tableView.register(cellType: ListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }


}
//MARK: - Extensions
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: ListTableViewCell.self, indexPath: indexPath)
        if let news = self.listViewModel.news(indexPath.row){
            cell.configure(news: news)
        }
        if let media = self.listViewModel.smallmedia(indexPath.row) {
            cell.configureMedia(media: media)
        }
        
        cell.newsImageView.layer.cornerRadius = 40
        cell.newsImageView.layer.borderColor = UIColor.black.cgColor
        cell.newsImageView.layer.borderWidth = 1
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let news = listViewModel.news(indexPath.row),
              let media = listViewModel.largemedia(indexPath.row) else {return}

        let detailViewModel = DetailsViewModel(news: news, media: media)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        detailVC.detailsViewModel = detailViewModel
        self.present(detailVC, animated: true)
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 180 }
    
}


extension ListViewController: ListViewModelDelegate, LoadingShowable {
    func showLoadingView() { showLoading() }
    
    func hideLoadingView() { hideLoading() }
    
    func reloadData() { tableView.reloadData() }
}

