//
//  NYTopStoriesResponse.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import Foundation

public struct NYTopStoriesResponse: Decodable {
    public let results: [News]
    
    private enum RootCodingKeys:String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([News].self, forKey: .results)
    }
}
