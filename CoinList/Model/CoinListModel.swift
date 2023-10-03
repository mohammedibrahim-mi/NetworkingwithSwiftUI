//
//  CoinListModel.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import Foundation


struct Coin: Codable {
    let success: Bool?
    let message: String?
    let data: [Datum]?
}


struct Datum: Codable , Identifiable{
    let id: Int?
    let name, code, dialCode: String?
    let logoURL: String?
    let logo: String?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case dialCode = "dial_code"
        case logoURL = "logo_url"
        case logo
    }
}
