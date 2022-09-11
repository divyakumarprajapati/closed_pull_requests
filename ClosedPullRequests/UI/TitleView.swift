//
//  TitleView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct TitleView: View {
    let user: User
    var body: some View {
        HStack {
            Spacer()
            AsyncImage(
                url: URL(string: user.avatarUrl),
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .transition(.scale(scale: 0.1, anchor: .center))
                case .failure:
                    Image(systemName: "wifi.slash")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 60, height: 60)
            .background(Color.gray)
            .clipShape(Circle())
            Spacer()
            Text(user.name)
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(user: User())
    }
}
