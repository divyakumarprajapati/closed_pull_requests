//
//  ContentView.swift
//  Shared
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    let perPage: Int
    let userName: String
    let repoName: String
    @StateObject var pullRequestRepo = PullRequestRepo()
    @StateObject var userRepo = UserRepo()
    @State var page = 1
    
    var body: some View {
        List {
            TitleView(user: userRepo.user, userName: userName)
            ForEach(pullRequestRepo.pullRequests, id: \.self.id) { pullRequest in
                PullRequestView(pullRequest: pullRequest)
            }
            PaginationView(onNextPressed: {
                page += 1
                pullRequestRepo.fetchPullRequests(userName: userName, repoName: repoName, page: page, perPage: perPage)
            }, onPreviousPressed: {
                page -= 1
                pullRequestRepo.fetchPullRequests(userName: userName, repoName: repoName, page: page, perPage: perPage)
            })
        }.onAppear {
            pullRequestRepo.fetchPullRequests(userName: userName, repoName: repoName, page: page, perPage: perPage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(perPage: 0, userName: "", repoName: "")
    }
}
