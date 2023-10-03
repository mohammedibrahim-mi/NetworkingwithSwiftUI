//
//  LoginviewModel.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import Foundation



class LoginViewModel : ObservableObject{
    
    
    @Published var message : String = ""
    @Published var loginval : Bool = false
    
    
    var services = AppService()
    
    
    func login(){
        
        services.loginAlamofirecall{ [weak self] data in
            
            print("23")
            print(data.message as Any)
            
            DispatchQueue.main.async {
                self?.message = data.message ?? "Login Failed"
                
                if(data.success!){
                    self?.loginval = true
                }
                
                print("loginval")
                print(self?.loginval)
                
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
