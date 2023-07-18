//
//  HomeAction.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/18.
//

import Foundation

public enum HomeAction {
    case onAppear
    case homeAPIResponse(items: [Item])
}
