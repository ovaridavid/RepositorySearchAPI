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
    public let starCount: Int?
    public let forkCount: Int?
    public let lastUpdate: Date
    public let creationData: Date
    public let owner: Owner
}
