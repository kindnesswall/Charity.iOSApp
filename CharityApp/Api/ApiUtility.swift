//
//  ApiUtility.swift
//  app
//
//  Created by Hamed.Gh on 12/30/18.
//  Copyright © 2018 Hamed.Gh. All rights reserved.
//

import Foundation
import Combine

class ApiUtility {
    
    public static func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, AppError> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970

      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
          .DataDecoding(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
    
    public static func convert<JsonType:Codable>(dic:[String:Any]?,to outputType:JsonType.Type)->JsonType? {
        
        guard let dic = dic else{
            return nil
        }
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: dic,options: .prettyPrinted) else {
            return nil
        }
        return convert(data: theJSONData, to: outputType)
    }
    
    public static func convert<JsonType:Codable>(data:Data?,to outputType:JsonType.Type)->JsonType? {
        
        guard let data=data else {
            return nil
        }
        let output=try? JSONDecoder().decode(outputType, from: data)
        return output
    }
    
    public static func convert<InputModel:Encodable>(input:InputModel)->Data?{
        return try? JSONEncoder().encode(input)
    }
    
    public static func watch(data:Data?){
        guard let data=data else {
            return
        }
        if let dataString=String(data: data, encoding: .utf8) {
            print(dataString)
        }
    }
}

