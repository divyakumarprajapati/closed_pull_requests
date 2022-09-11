//
//  PaginationView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 09/09/22.
//

import SwiftUI

struct PaginationView: View {
    let onNextPressed: () -> Void
    let onPreviousPressed: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                    self.onPreviousPressed()
                }, label: {
                    Text("Previous")
                }
            )
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
            Button(action: {
                    self.onNextPressed()
                }, label: {
                    Text("Next")
                }
            )
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct PaginationView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationView {
            print("djdj")
        } onPreviousPressed: {
            print("dhdhdh")
        }
    }
}
