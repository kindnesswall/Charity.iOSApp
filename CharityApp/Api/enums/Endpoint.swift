//
//  Endpoint.swift
//  app
//
//  Created by Hamed Ghadirian on 02.06.19.
//  Copyright © 2019 Hamed.Gh. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
    var url:URL? {get}
    var httpMethod: String {get}
    var httpBody: Data? {get}
}

enum Endpoint:EndpointProtocol {
    
    case GetGifts(input: GiftsRequestInput)
    
    private var basePathUrl:String{ return "/api/v1/"}
    private var usersBaseURL:String { return basePathUrl + "users/" }
    private var chatBaseURL:String { return basePathUrl + "chat/" }
    private var contactsBaseURL:String { return chatBaseURL + "contacts/" }
    private var giftsBaseURL:String{ return basePathUrl + "gifts/" }
    private var charityBaseURL:String{ return basePathUrl + "charity/" }
    private var profileBaseURL:String{ return basePathUrl + "profile/" }
    private var registerBaseURL:String{ return basePathUrl + "register/" }
    private var phoneNumberChangeBaseURL:String{ return registerBaseURL + "phoneNumberChange/" }
    
    var url:URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = self.scheme
        urlComponent.host = self.host
        urlComponent.port = 80
        urlComponent.path = self.path
        urlComponent.queryItems = self.queryItems
        return urlComponent.url
    }
    
    var httpBody: Data? {
        switch self {
            
        case .GetGifts(let input):
            return ApiUtility.convert(input: input)
        }
    }
    
    var httpMethod: String {
        switch self {
        case .GetGifts(_):
            return HttpMethod.POST.rawValue
        }
    }
    
    
    private var path:String {
        switch self {
        case .GetGifts:
            return giftsBaseURL
        }
    }
    
    private var queryItems: [URLQueryItem] {
        let queryItems:[URLQueryItem] = []
        return queryItems
    }
    
    private var host:String{
        return "185.211.58.168"
//        return "localhost"
    }
    
    private var scheme:String {
        return "http"
    }
}
