//
//  BirdViewService.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import Foundation
import Alamofire

protocol BirdViewServiceType {
    func getBirdViewList(skinType: String, page: Int, completion: @escaping (Result<Paging>) -> ())
    func getDetailInfo(num: Int, completion: @escaping (Result<Details>) -> ())
    func getSearchBirdViewList(search: String, completion: @escaping (Result<Paging>) -> ())
}

struct BirdViewService: BirdViewServiceType {
    
    static private let sharedManager: Alamofire.SessionManager = {
      let configuration = URLSessionConfiguration.default
      configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
      configuration.timeoutIntervalForRequest = 30
      configuration.timeoutIntervalForResource = 30
      configuration.requestCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
      return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func getBirdViewList(skinType: String, page: Int, completion: @escaping (Result<Paging>) -> ()) {
        
        var parameters = [String: Any]()
        parameters.updateValue(page, forKey: "page")
        
        if skinType != "" {
            parameters.updateValue(skinType, forKey: "skin_type")
        }
        
        BirdViewService.sharedManager
            .request(API.List.page, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value) :
                    do {
                        let decodableValue = try JSONDecoder().decode(Paging.self, from: value)
                        completion(Result.success(decodableValue))
                    } catch {
                        
                    }
                case .failure(let error):
                    print("error = \(error)")
                    completion(.failure(nil, error))
                }
        }
    }
    
    func getDetailInfo(num: Int, completion: @escaping (Result<Details>) -> ()) {
        
        BirdViewService.sharedManager
            .request("\(API.List.page)/\(num)", method: .get)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value) :
                    print(value)
                    do {
                        let decodableValue = try JSONDecoder().decode(Details.self, from: value)
                        completion(Result.success(decodableValue))
                    } catch {

                    }
                case .failure(let error):
                    print("error = \(error)")
                    completion(.failure(nil, error))
                }
        }
    }
    
    func getSearchBirdViewList(search: String, completion: @escaping (Result<Paging>) -> ()) {
        
        var parameters = [String: String]()
        parameters.updateValue(search, forKey: "search")
        
        BirdViewService.sharedManager
            .request(API.List.page, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value) :
                    do {
                        let decodableValue = try JSONDecoder().decode(Paging.self, from: value)
                        completion(Result.success(decodableValue))
                    } catch {
                        
                    }
                case .failure(let error):
                    print("error = \(error)")
                    completion(.failure(nil, error))
                }
        }
        
    }
}
