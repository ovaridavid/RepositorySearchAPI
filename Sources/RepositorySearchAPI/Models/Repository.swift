//
//  Repository.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public struct Repository: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let description: String?
    public let html_url: URL
    public let stargazers_count: Int
    public let forks_count: Int
    public let created_at: Date
    public let updated_at: Date
    public let owner: Owner
}

