//
//  JSONDecoder+GitHub.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

extension JSONDecoder {
    static let github: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
