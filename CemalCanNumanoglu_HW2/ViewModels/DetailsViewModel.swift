//
//  DetailsViewModel.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 17.05.2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var news: News { get }
    var media: NewsMultimedia { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    var news: News
    
    var media: NewsMultimedia
    
    init(news: News, media: NewsMultimedia) {
        self.news = news
        self.media = media
    }
}
