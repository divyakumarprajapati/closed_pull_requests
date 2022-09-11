//
//  User.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 11/09/22.
//

import SwiftUI

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarUrl = "avatar_url"
    }
    
    init() {
        self.id = -1
        self.name = ""
        self.avatarUrl = ""
    }
    
    init(id: Int, name: String, avatarUrl: String) {
        self.id = id
        self.name = name
        self.avatarUrl = avatarUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.avatarUrl = try values.decode(String.self, forKey: .avatarUrl)
        do {
            self.name = try values.decode(String.self, forKey: .name)
        } catch {
            self.name = ""
        }
    }
}
