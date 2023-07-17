//
//  HomeStore.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import Foundation

typealias HomeStore = Store<HomeState, HomeAction>

extension HomeStore {
    static var preview: HomeStore {
        HomeStore(initial: HomeState(items: []),
                  reducer: homeReducer,
                  middlewares: [homeAPIMiddleware]
        )
    }
}
