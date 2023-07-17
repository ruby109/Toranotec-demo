//
//  HomeView.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: HomeStore
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.state.items, id: \.name) { item in
                    NavigationLink(value: item) {
                        ItemView(name: item.name, price: item.price)
                    }
                }
            }
            .navigationDestination(for: Item.self, destination: { item in
                DetailView(item: item)
            })
            .navigationTitle(Text("Demo"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            store.dispatch(.onAppear)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let store = HomeStore.preview
        HomeView()
            .environmentObject(store)
    }
}
