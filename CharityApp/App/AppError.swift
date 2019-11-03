//
//  AppError.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 03.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case InvalidInput
    case ApiUrlProblem
    case NoInternet
    case DataDecoding
    case ServerError
    case DBFetch
    case NoData
    case ClientSide(message:String)
    case Unknown
}
