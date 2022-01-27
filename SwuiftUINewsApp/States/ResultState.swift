//
//  ResultState.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 21/01/2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}

extension ResultState: Equatable {
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(let lhsType), .failed(let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case (success(let lhsResult), success(let rhsResult)):
            return lhsResult == rhsResult
        default:
            return false
        }
    }
    
}
