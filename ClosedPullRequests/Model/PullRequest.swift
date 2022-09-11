//
//  PullRequest.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 10/09/22.
//

import SwiftUI

struct PullRequest: Identifiable, Codable {
    var id: Int
    var title: String
    var createdAt: String
    var closedAt: String
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt = "created_at"
        case closedAt = "closed_at"
        case user = "user"
    }
    
    init(id: Int, title: String, createdAt: String, closedAt: String, user: User) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.closedAt = closedAt
        self.user = user
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        user = try values.decode(User.self, forKey: .user)
        do {
            closedAt = try values.decode(String.self, forKey: .closedAt)
        } catch {
            closedAt = ""
        }
    }
}
