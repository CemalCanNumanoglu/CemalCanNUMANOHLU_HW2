//
//  NYTopStoriesService.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 12.05.2023.
//

import Foundation
import Alamofire

public protocol NYTopStoriesServiceProtocol: AnyObject {
    func fetchNews(completion: @escaping (Result<[News], Error>) -> Void)
}

final class NYTopStoriesService: NYTopStoriesServiceProtocol {
    
    public init() {}
    
    //Todo: URL PARÇALANACAK
    func fetchNews(completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString =  "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=9dySPmkAevDzy023E3GaqAw0tSEPbH5x"
        AF.request(urlString).responseData{ response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try
                    decoder.decode(NYTopStoriesResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("************* JSON DECODE ERROR ************")
                }
            case .failure(let error):
                print("**************** GEÇİCİ BİR HATA OLUŞTU:\(error.localizedDescription)*****************")
            }
        }
        
    }
    
    
}
