//
//  CoinListView.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import SwiftUI

struct CoinListView: View {
    
    @StateObject private var coinVM = CoinListViewModel()
    
    
    var body: some View {
        
        ScrollView{
          
            ForEach(coinVM.coins){ data in
                
                
                    Text(data.name ?? "Crypto")

            }
                .onAppear{
                    coinVM.fetchCountry()
                }
            
        }
        
 
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
