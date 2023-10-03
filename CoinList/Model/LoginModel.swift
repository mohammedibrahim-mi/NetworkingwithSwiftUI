//
//  LoginModel.swift
//  CoinList
//
//  Created by Pixel on 03/10/23.
//

import Foundation


struct LoginModel: Codable {
    let success: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken, tokenType, expiresAt: String?
    let user: User?
    let userDetail: UserDetail?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresAt = "expires_at"
        case user, userDetail
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let virtualAccountID, firstname, payID, ownID: String?
    let lastname, username, email: String?
    let emailVerifiedAt, passwordHash, passwordSecrect: JSONNull?
    let status: Int?
    let createdAt: JSONNull?
    let updatedAt: String?
    let lastLoginAt, lastLoginIP, lastSeenAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case virtualAccountID = "virtual_account_id"
        case firstname
        case payID = "pay_id"
        case ownID = "own_id"
        case lastname, username, email
        case emailVerifiedAt = "email_verified_at"
        case passwordHash = "password_hash"
        case passwordSecrect = "password_secrect"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case lastLoginAt = "last_login_at"
        case lastLoginIP = "last_login_ip"
        case lastSeenAt = "last_seen_at"
    }
}

// MARK: - UserDetail
struct UserDetail: Codable {
    let id, userID: Int?
    let fullName: String?
    let country, mobile: Int?
    let image, address: JSONNull?
    let isgoogle2Fa, isgoogle2FaStatus: Int?
    let google2FaSecret: JSONNull?
    let isemailotp: Int?
    let emailotpSecret: JSONNull?
    let iskycverification, isemailnotify: Int?
    let createdAt, updatedAt: String?
    let gender, isbankemail, verifyCode: JSONNull?
    let iskycverify, istwofaverify: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case fullName = "full_name"
        case country, mobile, image, address
        case isgoogle2Fa = "isgoogle2fa"
        case isgoogle2FaStatus = "isgoogle2fa_status"
        case google2FaSecret = "google2fa_secret"
        case isemailotp
        case emailotpSecret = "emailotp_secret"
        case iskycverification, isemailnotify
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case gender, isbankemail
        case verifyCode = "verify_code"
        case iskycverify, istwofaverify
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
