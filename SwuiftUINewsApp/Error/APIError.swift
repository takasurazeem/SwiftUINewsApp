//
//  APIError.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 21/01/2022.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the service."
        case .errorCode(let errorCode):
            return "\(errorCode) - something went wrong."
        case .unknown:
            return "The error is unknown."
        }
    }
}
