//
//  ListTableViewCell.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import UIKit
import SDWebImage

final class ListTableViewCell: UITableViewCell {

//MARK: - IBOUTLETS
 
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//MARK: - FUNCS
    func configure(news: News) {
        //prepareImage(with: news.url)
        newsTitleLabel.text = news.title
        authorLabel.text = news.byline
    }
    
    func configureMedia(media: NewsMultimedia){ prepareImage(with: media.url) }
    
    private func prepareImage(with urlString: String?) {
        let fullPath = urlString ?? ""
        
        if let url = URL(string: fullPath) { newsImageView.sd_setImage(with: url) }
    }
    
}
