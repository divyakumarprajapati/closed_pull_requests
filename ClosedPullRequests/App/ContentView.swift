//
//  ContentView.swift
//  Shared
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pullRequestRepo = PullRequestRepo()
    
    var body: some View {
        List {
            TitleView()
            ForEach(pullRequestRepo.pullRequests, id: \.self.id) { pullRequest in
                PullRequestView(pullRequest: pullRequest)
            }
        }.onAppear {
            pullRequestRepo.fetchPullRequests(page: 1, perPage: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
