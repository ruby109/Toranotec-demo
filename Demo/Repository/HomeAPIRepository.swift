//
//  HomeAPIRepository.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import Foundation
import Combine

protocol HomeAPIRepositoryProtocol {
    func getItems() -> AnyPublisher<[Item], Never>
}

class HomeAPIRepository: HomeAPIRepositoryProtocol {
    func getItems() -> AnyPublisher<[Item], Never> {
        fatalError("has not be implemented")
    }
}

class MockHomeAPIRepository: HomeAPIRepositoryProtocol {
    func getItems() -> AnyPublisher<[Item], Never> {
        guard let path = Bundle.main.path(forResource: "items", ofType: "json") else {
            return Just([]).eraseToAnyPublisher()
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let items = try JSONDecoder().decode(Items.self, from: data)
            return Just(items.items).eraseToAnyPublisher()
        } catch {
            return Just([]).eraseToAnyPublisher()
        }


    }
}
