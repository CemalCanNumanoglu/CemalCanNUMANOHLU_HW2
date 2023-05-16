//
//  News.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import Foundation

//MARK: - NewsResult
public struct NewsResult: Decodable {
    public let status, copyright, lastUpdated: String?
    public let section: String?
    public let numResults: Int?
    public let results: [News]?
    public let shortUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case section
        case results
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case shortUrl = "short_url"
    }
    
}
//MARK: - News
public struct News: Decodable {
    public let subsection: String?
    public let title: String?
    public let abstract: String?
    public let url: String?
    public let byline: String
    public let itemType: String?
    public let newsMultimedia: [NewsMultimedia]?
    
    enum CodingKeys: String, CodingKey {
        case subsection, title, abstract, url, byline
        case itemType = "item_type"
        case newsMultimedia = "multimedia"
    }
}
//MARK: - MultiMedia
public struct NewsMultimedia: Decodable {
    public let url: String?
    public let height: Int?
    public let width: Int?
    public let format: String?
}


