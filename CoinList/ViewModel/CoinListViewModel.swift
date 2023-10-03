//
//  CoinListViewModel.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import Foundation


class CoinListViewModel : ObservableObject{
    
    @Published var coins : [Datum] = []
    //or
    // @Published var coins  = [Datum]()
    
    var service = AppService()
    
    
    func fetchCountry(){

        service.coinService { [weak self]  data in
            
            print("data")
            print(data)
            DispatchQueue.main.async {
              self?.coins = data.data ?? []
            }
        }
    }
    
    
    
}
