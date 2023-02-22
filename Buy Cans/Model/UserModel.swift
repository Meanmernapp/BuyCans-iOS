//
//  UserModel.swift
//  Buy Cans
//
//  Created by HaiDeR AwAn on 22/02/2023.
//

import Foundation

struct UserModel : Codable {
    let id: Int?
    let name : String?
    let username : String?
    let address : AddressModel?
    let company : CompanyModel?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case address = "address"
        case company = "company"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        address = try values.decodeIfPresent(AddressModel.self, forKey: .address)
        company = try values.decodeIfPresent(CompanyModel.self, forKey: .company)
    }

}

struct AddressModel : Codable {
    let city: String?

    enum CodingKeys: String, CodingKey {

        case city = "city"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        city = try values.decodeIfPresent(String.self, forKey: .city)
    }

}
struct CompanyModel : Codable {
    let name: String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
