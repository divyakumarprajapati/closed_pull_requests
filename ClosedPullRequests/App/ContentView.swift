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
    @State var currentPage = 1
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, content: {
            TitleView(user: userRepo.user)
            List {
              Section {
                  ForEach(pullRequestRepo.pullRequests, id: \.self.id) { pullRequest in
                     PullRequestView(pullRequest: pullRequest)
                  }
              } header: {
                  HStack {
                      Text("Closed PR")
                          .font(.headline)
                          .fontWeight(.semibold)
                          .foregroundColor(Color.black)
                          .frame(minWidth: 0, maxWidth: .infinity)
                      Text("Created At")
                          .font(.headline)
                          .fontWeight(.semibold)
                          .foregroundColor(Color.black)
                          .frame(minWidth: 0, maxWidth: .infinity)
                      Text("Closed At")
                          .font(.headline)
                          .fontWeight(.semibold)
                          .foregroundColor(Color.black)
                          .frame(minWidth: 0, maxWidth: .infinity)
                  }
              }
            }
            .listStyle(.inset)
            PaginationView(currentPage: self.currentPage, currentPageEntriesCount: pullRequestRepo.pullRequests.count, onNextPressed: {
                self.currentPage += 1
                pullRequestRepo.fetchPullRequests(userName: self.userName, repoName: self.repoName, page: self.currentPage, perPage: self.perPage)
            }, onPreviousPressed: {
                self.currentPage -= 1
                pullRequestRepo.fetchPullRequests(userName: self.userName, repoName: self.repoName, page: self.currentPage, perPage: self.perPage)
            })
        })
        .onAppear {
            userRepo.fetchUser(userName: self.userName)
            pullRequestRepo.fetchPullRequests(userName: self.userName, repoName: self.repoName, page: self.currentPage, perPage: self.perPage)
        }
        .background(Color.yellow.opacity(0.3))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(perPage: 0, userName: "", repoName: "")
    }
}
