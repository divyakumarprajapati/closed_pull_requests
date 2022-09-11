//
//  TitleView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct UserView: View {
    let user: User
    var body: some View {
        HStack {
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
            .frame(width: 50, height: 50)
            .background(Color.gray)
            .clipShape(Circle())
            .padding(.horizontal, 10.0)
            Text(user.name)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User())
    }
}
