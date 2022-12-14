//
//  PullRequestRepo.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 10/09/22.
//

import SwiftUI

class PullRequestRepo: ObservableObject {
    @Published var pullRequests: [PullRequest] = []
    func fetchPullRequests(userName: String, repoName: String, page: Int, perPage: Int) {
        guard let url = URL(string: "https://api.github.com/repos/\(userName)/\(repoName)/pulls?page=\(page)&per_page=\(perPage)&state=closed") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            let data = data!
            do {
                let pullRequests = try JSONDecoder().decode([PullRequest].self, from: data)
                DispatchQueue.main.async {
                    self.pullRequests = pullRequests
                }
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}
