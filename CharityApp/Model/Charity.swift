//
//  Charity.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 03.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import Foundation

class Charity: Codable {
    var id: Int?
    var userId:Int?
    var isRejected:Bool?
    var imageUrl: String?
    var name: String?
    var manager: String?
    var registerId: String?
    var registerDate: String?
    var address: String?
    var telephoneNumber: String?
    var mobileNumber: String?
    var website: String?
    var email: String?
    var instagram: String?
    var telegram: String?
    var twitter:String?
    var description: String?
    var updatedAt:String?
}
