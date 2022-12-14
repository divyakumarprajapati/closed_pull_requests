//
//  PullRequestView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 09/09/22.
//

import SwiftUI

struct PullRequestView: View {
    let pullRequest: PullRequest
    @State var expanded: Bool = false
    var body: some View {
        HStack {
            HStack {
                Text(pullRequest.title)
                    .font(.headline)
                    .frame(height: expanded ? .infinity : 30)
                    .truncationMode(.tail)
                Spacer()
            }
            .onTapGesture(perform: {
                expanded = !expanded
            })
            .frame(minWidth: 0, maxWidth: .infinity)
            Text(formatDate(date: pullRequest.createdAt))
                .font(.subheadline)
                .frame(minWidth: 0, maxWidth: .infinity)
            Text(formatDate(date: pullRequest.closedAt))
                .font(.subheadline)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(.vertical, 4.0)
    }
    func formatDate(date: String) -> String {
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let dates = dateFormator.date(from: date) else { return Date.now.ISO8601Format() }
        let newDateFormator = DateFormatter()
        newDateFormator.dateFormat = "dd-MM-yyyy"
        return newDateFormator.string(from: dates)
    }
}

struct PullRequestView_Previews: PreviewProvider {
    static let pullRequest = PullRequest(id: 1, title: "Pull Request hhhbhbh", createdAt: "11/05/2022", closedAt: "11/05/2022", user: User())
    static var previews: some View {
        PullRequestView(pullRequest: pullRequest)
    }
}
