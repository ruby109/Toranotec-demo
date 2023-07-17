//
//  Store.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import Foundation
import Combine

class Store<State, Action>: ObservableObject {
  @Published private(set) var state: State
  private let reducer: Reducer<State, Action>
  private let middlewares: [Middleware<State, Action>]
  private let queue = DispatchQueue(label: "com.ruby109.Demo.store", qos: .userInitiated)
  private var subscriptions: Set<AnyCancellable> = []

  init(
    initial: State,
    reducer: @escaping Reducer<State, Action>,
    middlewares: [Middleware<State, Action>] = []
  ) {
    self.state = initial
    self.reducer = reducer
    self.middlewares = middlewares
  }

  // The dispatch function dispatches an action to the serial queue.
  func dispatch(_ action: Action) {
    queue.sync {
      self.dispatch(self.state, action)
    }
  }

  // The internal work for dispatching actions
  private func dispatch(_ currentState: State, _ action: Action) {
    // generate a new state using the reducer
    let newState = reducer(currentState, action)

    // pass the new state and action to all the middlewares
    // if they publish an action dispatch pass it to the dispatch function
    middlewares.forEach { middleware in
      let publisher = middleware(newState, action)
      publisher
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: dispatch)
        .store(in: &subscriptions)
    }

    // Finally set the state to the new state
    state = newState
  }
}
