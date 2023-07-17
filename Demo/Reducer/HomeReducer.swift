//
//  HomeReducer.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import Foundation

let homeReducer: Reducer<HomeState, HomeAction> = { state, action in
    var mutatingState = state

    switch action {
    case .onAppear:
        mutatingState.isLoading = true
    case .homeAPIResponse(let items):
        mutatingState.items = items
        mutatingState.isLoading = false
    }

    return mutatingState
}
