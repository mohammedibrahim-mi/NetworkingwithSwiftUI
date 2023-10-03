//
//  File.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import Foundation
import Alamofire
import Combine


class AppService{
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    func loginCall( completion : @escaping(LoginModel) -> Void  ){
        
        
        let url = "https://apius.cryptoandco.io/api/login"
        
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        do{
            
            let param : [String: Any] = [
                "email":"test@mailinator.com",
                "password":"Test@123",
                "device_id":"sds343434",
                "device_type":"Andriod",
                "ip":"Test@123"
            ]
            
            print(param)
            
            let jsonData = try JSONSerialization.data(withJSONObject: param)
            
            request.httpBody = jsonData
            
            print("11")
        }
        catch{
            
        }
        
        
    
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            print("13")
            print(data)
            print(error?.localizedDescription)
            print(response)
            if let error = error {
                
                
                print( error.localizedDescription)
                
            }
            
            
            
            guard let data = data else {
                return
            }
            
            
            do {
                print("1")
                let decodedatas = try JSONDecoder().decode(LoginModel.self, from: data)
                completion(decodedatas)
            }
            catch{
                print("12")
            }

            
        }.resume()

    }
    
    
    
    func loginAlamofirecall(compl : @escaping(LoginModel)-> Void ) {
        
        
    
        
        let url = "https://new.demozab.com/armup/api/public/api/login"
        
        guard let url = URL(string: url) else { return }
        
        
        let params = ["email":"manokaran@mailinator.com","password":"Test@123"]
        
        
        AF.request(url, method: .post,parameters: params, headers: nil)
            .publishDecodable(type: LoginModel.self)
            .compactMap { response in
                response.value
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                
                response in
                
                compl(response)
                print("response")
                print(response)
                
                
            })
            .store(in: &self.cancellables)
        
      
        
    }
    
    
    
    
    
    func coinService (completions : @escaping(Coin) -> Void ){
        let url = "https://new.demozab.com/armup/api/public/api/countries"
        
        guard let url = URL(string: url) else{ return }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                         print("Error: \(error.localizedDescription)")
                         return
                     }
            
            
            guard let data = data else{ return }
            
            print(data)
            

            do{
                let decodeddata = try JSONDecoder().decode(Coin.self, from: data)
                
                print(decodeddata)
                
                completions(decodeddata)

            }
            catch{
                print("Decode failed")
            }

        }.resume()
    }
    
    
    // need to pass array in completion
    
    func coinListService (completions : @escaping([Datum]) -> Void ){
        
        let url = "https://new.demozab.com/armup/api/public/api/countries"
        
        guard let url = URL(string: url) else{ return }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                         print("Error: \(error.localizedDescription)")
                         return
                     }
            
            
            guard let data = data else{ return }
            
            print(data)
            

            do{
                let decodeddata = try JSONDecoder().decode(Coin.self, from: data)
                
                print(decodeddata)
                
                completions(decodeddata.data ?? [])

            }
            catch{
                print("Decode failed")
            }

        }.resume()
    }
    
    
    
}
