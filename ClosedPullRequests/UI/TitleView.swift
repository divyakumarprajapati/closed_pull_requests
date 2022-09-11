//
//  TitleView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 08/09/22.
//

import SwiftUI

struct TitleView: View {
    let user: User
    let userName: String
    var body: some View {
        HStack {
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
            Spacer()
            Text(userName)
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(user: User(), userName: "")
    }
}
