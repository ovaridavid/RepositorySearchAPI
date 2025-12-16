//
//  Owner.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

public struct Owner: Decodable {
    public let login: String
    public let avatar_url: URL
    public let html_url: URL
}
