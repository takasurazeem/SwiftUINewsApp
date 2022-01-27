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
