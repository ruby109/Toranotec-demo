//
//  DetailView.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack {
                Text("Price")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)

                Text("123")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .center)

            VStack {
                Text("Keywords")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)

                Text("abc")
                Text("def")
            }

            Spacer()
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
