//
//  SearchResponse.swift
//  RepositorySearchAPI
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

struct SearchResponse: Decodable {
    let items: [Repository]
}
