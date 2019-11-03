//
//  GiftsRequestInput.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 03.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import Foundation

class GiftsRequestInput: Codable {
    var beforeId:Int?
    var count:Int?
    var categoryId:Int?
    var provinceId:Int?
    var cityId:Int?
    
    init(beforeId:Int, count:Int) {
        self.beforeId = beforeId
        self.count = count
    }
    
    init() {
        
    }
}
