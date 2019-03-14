//
//  Movie.swift
//  SearchMovie
//
//  Created by Xiaolu on 3/1/19.
//

import Foundation
struct GetListResponse : Codable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [Movie]
}

struct Movie : Codable {
    let id : Int
    let title : String
    let poster_path : String?
    let overview : String
    let vote_average: Double
    let vote_count : Int
    let release_date : String
}
