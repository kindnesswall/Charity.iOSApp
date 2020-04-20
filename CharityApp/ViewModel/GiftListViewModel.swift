//
//  GiftListViewModel.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 03.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GiftListViewModel:ObservableObject {
    private var disposables = Set<AnyCancellable>()

    lazy var httpLayer = HTTPLayer()
    lazy var apiService = ApiService(httpLayer)
    
    @Published var gifts:[Gift] = []
    
    init() {
        getGifts()
    }
    
    func getGifts(){
        
        let input=GiftsRequestInput()
        let endPoint = Endpoint.GetGifts(input: input)

        apiService.getGifts(endPoint: endPoint)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.gifts = []
          case .finished:
            break
          }
          }, receiveValue: { [weak self] gifts in
            guard let self = self else { return }
            self.gifts = gifts
        })
        .store(in: &disposables)
        
    }
}
