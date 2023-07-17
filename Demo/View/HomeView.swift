//
//  HomeView.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {

            }.navigationBarTitle("Demo")
        }
        .onAppear {

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
