//
//  ContentView.swift
//  Shared
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pullRequestRepo = PullRequestRepo()
    @State var page = 1
    var perPage = 10
    
    var body: some View {
        List {
            TitleView()
            ForEach(pullRequestRepo.pullRequests, id: \.self.id) { pullRequest in
                PullRequestView(pullRequest: pullRequest)
            }
            PaginationView(onNextPressed: {
                page += 1
                pullRequestRepo.fetchPullRequests(page: page, perPage: perPage)
            }, onPreviousPressed: {
                page -= 1
                pullRequestRepo.fetchPullRequests(page: page, perPage: perPage)
            })
        }.onAppear {
            pullRequestRepo.fetchPullRequests(page: page, perPage: perPage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
