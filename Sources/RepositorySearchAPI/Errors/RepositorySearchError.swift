//
//  RepositorySearchError.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public enum RepositorySearchError: Error {
    case invalidURL
    case invalidResponse
    case unauthorized
    case notFound
    case httpError(statusCode: Int)
}
