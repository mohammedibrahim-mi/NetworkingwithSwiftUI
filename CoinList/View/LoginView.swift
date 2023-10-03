//
//  LoginView.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import SwiftUI

struct LoginView: View {
    
    
    @StateObject private var loginVM = LoginViewModel()
    
    
    
    var body: some View {
        
        
        NavigationStack{
            

            NavigationLink(destination: CoinListView()){
                Text(loginVM.message)
            }
            
//            NavigationLink(destination: CoinListView(), isActive: $loginVM.loginval){
//                Text(loginVM.message)
//            }
           
            
                .onAppear{
                    
                    loginVM.login()
                    
                    
                }
            
        }
        
        
   
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
