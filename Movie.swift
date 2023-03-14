//
//  Movie.swift
//  lab-tunley
//
//  Created by Kripa Lamichhane on 3/13/23.
//

import Foundation
struct MovieSearchResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let poster_path: URL
    let original_title : String
    let overview: String
    let original_language: String
    let vote_average: Double
    let title: String
    let release_date: String
    
}
