//
//  MovieDetail.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RealmSwift

class MovieDetail: Object, Codable {
    @objc dynamic var Title: String = ""
    @objc dynamic var Year: String = ""
    @objc dynamic var Rated: String = ""
    @objc dynamic var Released: String = ""
    @objc dynamic var Runtime: String = ""
    @objc dynamic var Genre: String = ""
    @objc dynamic var Director: String = ""
    @objc dynamic var Writer: String = ""
    @objc dynamic var Actors: String = ""
    @objc dynamic var Plot: String = ""
    @objc dynamic var Language: String = ""
    @objc dynamic var Country: String = ""
    @objc dynamic var Awards: String = ""
    @objc dynamic var Poster: String = ""
    var Ratings = List<Rate>()
    @objc dynamic var Metascore: String = ""
    @objc dynamic var imdbRating: String = ""
    @objc dynamic var imdbVotes: String = ""
    @objc dynamic var imdbID: String = ""
    @objc dynamic var `Type`: String = ""
    @objc dynamic var DVD: String? = ""
    @objc dynamic var BoxOffice: String? = ""
    @objc dynamic var Production: String? = ""
    @objc dynamic var Website: String? = ""
    @objc dynamic var Response: String = ""
    
    override static func primaryKey() -> String {
        return "imdbID"
    }
}
