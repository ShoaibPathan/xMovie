//
//  MovieList.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RealmSwift

class MovieList: Object, Codable {
    var Search = List<Movie>()
    @objc dynamic var totalResults: String = ""
    @objc dynamic var Response: String = ""
    
}
