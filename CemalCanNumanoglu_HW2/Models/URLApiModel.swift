//
//  URLApiModel.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 13.05.2023.
//

import Foundation

struct UrlApiModel {
     let scheme: String?
     let host: String?
     let path: String?
     let queryItems: [URLQueryItem]?

     init?(url: URL) { 
         guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
             return nil
         }

         scheme = components.scheme
         host = components.host
         path = components.path

         if let queryItems = components.queryItems, !queryItems.isEmpty {
             self.queryItems = queryItems
         } else {
             queryItems = nil
         }
     }
}
