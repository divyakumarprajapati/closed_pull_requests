//
//  PullRequestView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 09/09/22.
//

import SwiftUI

struct PullRequestView: View {
    let pullRequest: PullRequest
    var body: some View {
        HStack {
            Text(pullRequest.title)
            Text(pullRequest.createdAt)
            Text(pullRequest.closedAt)
        }
    }
    func formatDate(date: Date) -> String {
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = "DD/MM/YYYY"
        return dateFormator.string(from: date)
    }
}

struct PullRequestView_Previews: PreviewProvider {
    static let pullRequest = PullRequest(id: 1, title: "Pull Request", createdAt: "11/05/2022", closedAt: "11/05/2022", user: User())
    static var previews: some View {
        PullRequestView(pullRequest: pullRequest)
    }
}
