//
//  RepositorySearchAPIClient.swift
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
}

// MARK: - Public API
public extension RepositorySearchAPIClient {
    func searchRepositories(query: String) async throws -> [Repository] {
        let url = try RepositorySearchEndpoint.search(query: query).url()
        let response: SearchResponse = try await performRequest(
            url: url,
            decode: SearchResponse.self
        )
        return response.items
    }

    func repositoryDetail(
        owner: String,
        name: String
    ) async throws -> Repository {

        let url = try RepositorySearchEndpoint.repository(
            owner: owner,
            name: name
        ).url()

        return try await performRequest(
            url: url,
            decode: Repository.self
        )
    }
}

// MARK: - Private helpers
private extension RepositorySearchAPIClient {
    func performRequest<T: Decodable>(
        url: URL,
        decode type: T.Type
    ) async throws -> T {

        let (data, response) = try await session.data(from: url)
        try validate(response)
        return try decode(T.self, from: data)
    }

    func validate(_ response: URLResponse) throws {
        guard let http = response as? HTTPURLResponse else {
            throw RepositorySearchError.invalidResponse
        }

        switch http.statusCode {
        case 200...299:
            return
        case 401:
            throw RepositorySearchError.unauthorized
        case 404:
            throw RepositorySearchError.notFound
        default:
            throw RepositorySearchError.httpError(statusCode: http.statusCode)
        }
    }

    func decode<T: Decodable>(
        _ type: T.Type,
        from data: Data
    ) throws -> T {
        try JSONDecoder.github.decode(T.self, from: data)
    }
}
