//
//  closed_pull_requestsApp.swift
//  Shared
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

@main
struct ClosedPullRequestsApp: App {
    var perPage = 10
    var userName = "divyakumarprajapati"
    var repoName = "closed_pull_requests"
    var body: some Scene {
        WindowGroup {
            ContentView(perPage: perPage, userName: userName, repoName: repoName)
        }
    }
}
