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
            .padding([.leading, .bottom], 10.0)
            .disabled(currentPage == 1)
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
            Button(action: {
                    self.onNextPressed()
                }, label: {
                    Text("Next")
                }
            )
            .padding([.bottom, .trailing], 10.0)
            .disabled(currentPageEntriesCount == 0 || currentPageEntriesCount < Config.perPage)
            .buttonStyle(BorderlessButtonStyle())
        }
        .fixedSize(horizontal: false, vertical: true)
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
