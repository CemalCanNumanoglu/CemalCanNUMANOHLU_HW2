//
//  ListTableViewCell.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import UIKit
import SDWebImage

final class ListTableViewCell: UITableViewCell {

    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var newsTitleLabel: UILabel!
    @IBOutlet var statementLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(news: News) {
        //prepareImage(with: news.url)
        newsTitleLabel.text = news.title
        statementLabel.text = news.abstract
        authorLabel.text = news.byline
    }
    
    func configureMedia(media: NewsMultimedia){
        prepareImage(with: media.url)
    }
    
    private func prepareImage(with urlString: String?) {
        let fullPath = urlString ?? ""
        
        if let url = URL(string: fullPath) {
            newsImageView.sd_setImage(with: url)
        }
    }
    
}
