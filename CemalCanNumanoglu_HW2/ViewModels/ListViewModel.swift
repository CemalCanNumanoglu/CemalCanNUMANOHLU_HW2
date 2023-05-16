//
//  ListViewModel.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import Foundation

protocol ListViewModelProtocol {
    var delegate: ListViewModelDelegate? { get set}
    var numberOfItems: Int { get }
    
    func fetchData()
    func news(_ index: Int) -> News?
    func media(_ index: Int) -> NewsMultimedia?
}

protocol ListViewModelDelegate: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}

final class ListViewModel {
    private var news: [News] = []
    private var media: [NewsMultimedia] = []
    let service: NYTopStoriesServiceProtocol
    weak var delegate: ListViewModelDelegate?
    
    init(service: NYTopStoriesServiceProtocol, delegate: ListViewModelDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    fileprivate func fetchNews() {
        self.delegate?.showLoadingView()
        service.fetchNews { [ weak self ] response in
            guard let self else { return }
            self.delegate?.hideLoadingView()
            switch response {
            case .success(let news):
                print("News: \(news)")
                self.news = news
                self.media = news.compactMap { $0.newsMultimedia?.first }
                self.delegate?.reloadData()
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
}

extension ListViewModel: ListViewModelProtocol {
    func media(_ index: Int) -> NewsMultimedia? {
        var media = news[index].newsMultimedia?.compactMap({ element in
            element.format == "Large Thumbnail" ? element : nil
        }).last
        return media
    }
    
    var numberOfItems: Int {
        news.count
    }
    
    func fetchData() {
        fetchNews()
    }
    
    func news(_ index: Int) -> News? {
        news[index]
    }
    
    
}
