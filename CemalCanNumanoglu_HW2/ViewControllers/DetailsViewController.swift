//
//  DetailsViewController.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 17.05.2023.
//

import UIKit
import SDWebImage
import SafariServices

final class DetailsViewController: UIViewController {
   
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    var detailsViewModel: DetailsViewModelProtocol!


    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        
        updateView()
        
        
    }
    
    private func updateView() {
        guard let detailsViewModel = detailsViewModel else {return}
        newsTitle.text = detailsViewModel.news.title
        abstract.text = detailsViewModel.news.abstract
        authorLabel.text = detailsViewModel.news.byline
        if let imageUrl = URL(string: detailsViewModel.media.url ?? "") {
            prepareImage(from: imageUrl)
        }
    }
    
    private func prepareImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.newsImage.image = UIImage(data: data)
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    @IBAction func seeMoreBtnClicked(_ sender: Any) {
        guard let url = URL(string: detailsViewModel.news.shortUrl ?? "") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        modalPresentationStyle = .fullScreen
    }
    
    
    
}
