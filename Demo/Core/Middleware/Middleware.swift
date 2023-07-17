//
//  Middleware.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>
