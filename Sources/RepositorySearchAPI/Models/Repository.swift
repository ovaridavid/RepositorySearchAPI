//
//  Repository.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public struct Repository: Decodable {
    public let id: Int
    public let name: String
    public let description: String?
    public let html_url: URL
    public let stargazers_count: Int
    public let forks_count: Int
    public let created_at: Date
    public let updated_at: Date
    public let owner: Owner

    public init(
        id: Int,
        name: String,
        description: String?,
        html_url: URL,
        stargazers_count: Int,
        forks_count: Int,
        created_at: Date,
        updated_at: Date,
        owner: Owner
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.html_url = html_url
        self.stargazers_count = stargazers_count
        self.forks_count = forks_count
        self.created_at = created_at
        self.updated_at = updated_at
        self.owner = owner
    }
}

