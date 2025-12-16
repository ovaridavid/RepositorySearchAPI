//
//  Owner.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public struct Owner: Decodable {
    public let name: String
    public let avatarUrl: URL
    public let profileUrl: URL
}
