//
//  Cans Model.swift
//  Buy Cans
//
//  Created by HaiDeR AwAn on 22/02/2023.
//

import Foundation

struct CansModel : Codable {
    let id: Int?
    let name : String?
    let tagLine : String?
    let description : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case tagLine = "tagline"
        case description = "description"
        case image = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        tagLine = try values.decodeIfPresent(String.self, forKey: .tagLine)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
