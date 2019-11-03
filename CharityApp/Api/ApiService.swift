//
//  ApiServiceProtocol.swift
//  app
//
//  Created by Hamed Ghadirian on 02.06.19.
//  Copyright © 2019 Hamed.Gh. All rights reserved.
//

import Foundation
import Combine

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
    
    func getCharityList() -> AnyPublisher<[Charity], AppError>{
        let publisher:AnyPublisher<[Charity], AppError> =
            self.httpLayer.request(at: Endpoint.CharityList)
        
        return publisher
    }
    
    func getGifts(endPoint: Endpoint) -> AnyPublisher<[Gift], AppError> {
        let publisher:AnyPublisher<[Gift], AppError> =
            self.httpLayer.request(at: endPoint)
        
        return publisher
    }

}

