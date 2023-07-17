//
//  HomeAPIMiddleware.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import Foundation
import Combine

private let homeAPIRepository: HomeAPIRepositoryProtocol = MockHomeAPIRepository()

let homeAPIMiddleware: Middleware<HomeState, HomeAction> = { state, action in
    switch action {
    case .onAppear:
        return homeAPIRepository.getItems()
            .map { HomeAction.homeAPIResponse(items: $0) }
            .eraseToAnyPublisher()
    case .homeAPIResponse:
        break
    }

    return Empty().eraseToAnyPublisher()
}
