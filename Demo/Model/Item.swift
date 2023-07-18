//
//  Item.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import Foundation

public struct Item: Codable, Hashable, Equatable {
    let name: String?
    let price: Int?
    let keywords: [String]?
}

struct Items: Codable {
    let items: [Item]?
}
