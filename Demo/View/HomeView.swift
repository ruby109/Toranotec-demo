//
//  HomeView.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import SwiftUI

struct HomeView: View {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        let themeColor = UIColor(named: "ThemeColor") ?? UIColor.black
        coloredAppearance.titleTextAttributes = [.foregroundColor: themeColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: themeColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        UINavigationBar.appearance().tintColor = themeColor
    }

    @EnvironmentObject var store: HomeStore
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(store.state.items, id: \.name) { item in
                        NavigationLink(value: item) {
                            ItemView(name: item.name ?? "", price: item.price ?? 0)
                        }
                    }
                }
                .navigationDestination(for: Item.self, destination: { item in
                    DetailView(item: item)
                })
                .navigationTitle(Text("Demo"))
                .navigationBarTitleDisplayMode(.inline)
            }

            if store.state.isLoading {
                ActivityIndicator()
            }
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
