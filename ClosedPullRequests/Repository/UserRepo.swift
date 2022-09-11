//
//  UserRepo.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 11/09/22.
//

import SwiftUI

class UserRepo: ObservableObject {
    @Published var user: User = User()
    func fetchUser(userName: String) {
        guard let url = URL(string: "https://api.github.com/\(userName)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            let data = data!
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.user = user
                }
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}
