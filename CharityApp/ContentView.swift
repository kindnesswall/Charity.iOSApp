//
//  ContentView.swift
//  CharityApp
//
//  Created by Hamed Ghadirian on 02.11.19.
//  Copyright © 2019 Hamed Ghadirian. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var giftListVM = GiftListViewModel()
    var body: some View {
        NavigationView{
            List(giftListVM.gifts, id: \.id) { gift in
                Text(gift.title ?? "")
            }
            .navigationBarTitle("Gifts")
            .navigationBarItems(trailing: Button(action: {
                self.giftListVM.getGifts()
            }, label: {
                Text("Reload")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
