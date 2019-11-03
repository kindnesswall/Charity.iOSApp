//
//  GiftListViewModel.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 03.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import Foundation
import SwiftUI

class GiftListViewModel:ObservableObject {
    
    lazy var httpLayer = HTTPLayer()
    lazy var apiService = ApiService(httpLayer)
    
    @Published var gifts:[Gift] = []
    
    func getGifts(){
        
        let input=GiftsRequestInput()
        let endPoint = Endpoint.GetGifts(input: input)

        apiService.getGifts(endPoint:endPoint) { [weak self] (result) in
            
            DispatchQueue.main.async {
                self?.handleGetGift(result)
            }
        }
        
    }
    
    func handleGetGift(_ result:Result<[Gift]>) {
        switch result {
        case .failure(let error):
            print(error)

        case .success(let gifts):
            self.gifts = gifts
        }
    }
}
