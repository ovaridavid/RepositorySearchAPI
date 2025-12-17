//
//  RepositorySearchEndpoint.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

enum RepositorySearchEndpoint {
    case search(query: String)
    case repository(owner: String, name: String)

    func url() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"

        switch self {

        case .search(let query):
            components.path = "/search/repositories"
            components.queryItems = [
                URLQueryItem(name: "q", value: query)
            ]

        case .repository(let owner, let name):
            components.path = "/repos/\(owner)/\(name)"
        }

        guard let url = components.url else {
            throw RepositorySearchError.invalidURL
        }

        return url
    }
}
