//
//  Movie.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object, Codable {
    @objc dynamic var Title: String = ""
    @objc dynamic var Year: String = ""
    @objc dynamic var imdbID: String = ""
    @objc dynamic var `Type`: String = ""
    @objc dynamic var Poster: String = ""
    
    override static func primaryKey() -> String {
        return "imdbID"
    }
}
