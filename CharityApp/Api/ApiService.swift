//
//  ApiServiceProtocol.swift
//  app
//
//  Created by Hamed Ghadirian on 02.06.19.
//  Copyright © 2019 Hamed.Gh. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol {

}

class ApiService:ApiServiceProtocol {
    let httpLayer: HTTPLayerProtocol
    init(_ httpLayer: HTTPLayerProtocol) {
        self.httpLayer = httpLayer
    }
    
    func cancelRequestAt(index:Int) {
        httpLayer.cancelRequestAt(index: index)
    }
    
    func cancelAllRequests() {
        httpLayer.cancelAllTasksAndSessions()
    }
    
    func findIndexOf(task:URLSessionTask?)->Int?{
        return httpLayer.findIndexOf(task: task)
    }
    
    func getCharityList(completion: @escaping (Result<[Charity]>) -> Void){
        
        self.httpLayer.request(at: Endpoint.CharityList) {(result) in
            switch result{
            case .failure(let appError):
                completion(.failure(appError))
            case .success(let data):
                if let charities = ApiUtility.convert(data: data, to: [Charity].self){
                    completion(.success(charities))
                }else{
                    completion(.failure(AppError.DataDecoding))
                }
            }
        }
    }
    
    func getGifts(endPoint: Endpoint, completion: @escaping (Result<[Gift]>)-> Void) {
        self.httpLayer.request(at: endPoint) {[weak self] (result) in
            self?.handleGiftList(result: result, completion: completion)
        }
    }
    
    func handleGiftList(result: Result<Data>, completion: @escaping (Result<[Gift]>)-> Void) {
        switch result{
        case .failure(let appError):
            completion(.failure(appError))
        case .success(let data):
            if let gifts = ApiUtility.convert(data: data, to: [Gift].self){
                completion(.success(gifts))
            }else{
                completion(.failure(AppError.DataDecoding))
            }
        }
    }
    
}

