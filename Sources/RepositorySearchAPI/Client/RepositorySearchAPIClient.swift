//
//  RepositorySearchAPIClientProtocol.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public protocol RepositorySearchAPIClientProtocol {
    func searchRepositories(query: String) async throws -> [Repository]
    func repositoryDetail(owner: String, name: String) async throws -> Repository
}

public final class RepositorySearchAPIClient: RepositorySearchAPIClientProtocol {

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func searchRepositories(query: String) async throws -> [Repository] {
        let url = try RepositorySearchEndpoint.search(query: query).url()

        let (data, response) = try await session.data(from: url)

        guard let http = response as? HTTPURLResponse,
              200..<300 ~= http.statusCode else {
            throw RepositorySearchError.invalidResponse
        }

        let decoded = try JSONDecoder.github.decode(SearchResponse.self, from: data)
        return decoded.items
    }

    public func repositoryDetail(
        owner: String,
        name: String
    ) async throws -> Repository {

        let url = try RepositorySearchEndpoint.repository(owner: owner, name: name).url()

        let (data, response) = try await session.data(from: url)

        guard let http = response as? HTTPURLResponse,
              200..<300 ~= http.statusCode else {
            throw RepositorySearchError.invalidResponse
        }

        return try JSONDecoder.github.decode(Repository.self, from: data)
    }
}
