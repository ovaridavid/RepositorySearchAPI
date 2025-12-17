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

    public init(
        login: String,
        avatar_url: URL,
        html_url: URL
    ) {
        self.login = login
        self.avatar_url = avatar_url
        self.html_url = html_url
    }
}
