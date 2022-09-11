//
//  PaginationView.swift
//  closed_pull_requests (iOS)
//
//  Created by Divyakumar Prajapati on 09/09/22.
//

import SwiftUI

struct PaginationView: View {
    let currentPage: Int;
    let currentPageEntriesCount: Int
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
            .disabled(currentPage == 1)
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
            Button(action: {
                    self.onNextPressed()
                }, label: {
                    Text("Next")
                }
            )
            .disabled(currentPageEntriesCount == 0 || currentPageEntriesCount < 10)
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct PaginationView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationView(currentPage: 1, currentPageEntriesCount: 0, onNextPressed: {
            print("Next Pressed")
        }, onPreviousPressed: {
            print("Previous Pressed")
        })
    }
}
