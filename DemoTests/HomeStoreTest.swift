//
//  HomeStoreTest.swift
//  DemoTests
//
//  Created by 沈 立竑 on 2023/07/18.
//

import XCTest
@testable import Demo

typealias HomeStore = Store<HomeState, HomeAction>

final class HomeStoreTest: XCTestCase {
    private var store: HomeStore?
    override func setUpWithError() throws {
        store = HomeStore(initial: HomeState(),
                          reducer: homeReducer,
                          middlewares: [homeAPIMiddleware])
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testOnAppearAction() {
        guard let store = self.store else {
            return
        }
        store.dispatch(.onAppear)
        let newState = HomeState(items: [], isLoading: true)
        XCTAssertEqual(store.state, newState)
        
    }

    func testHomeAPIResponseAction() {
        guard let store = self.store else {
            return
        }
        let items = [
            Item(name: "item1", price: 123, keywords: ["A", "B", "C"]),
            Item(name: "item2", price: 456, keywords: ["D", "E", "F"])
        ]
        store.dispatch(.homeAPIResponse(items: items))
        let newState = HomeState(items: items, isLoading: false)
        XCTAssertEqual(store.state, newState)
    }


}
