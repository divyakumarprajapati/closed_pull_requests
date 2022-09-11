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
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                   image
                       .resizable()
                       .scaledToFill()
               } placeholder: {
                   ProgressView()
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
