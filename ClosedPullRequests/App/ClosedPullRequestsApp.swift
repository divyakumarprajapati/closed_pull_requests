//
//  closed_pull_requestsApp.swift
//  Shared
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

@main
struct ClosedPullRequestsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(perPage: Config.perPage, userName: Config.userName, repoName: Config.repoName)
        }
    }
}
