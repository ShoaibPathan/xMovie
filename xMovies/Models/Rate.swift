//
//  Rate.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RealmSwift

class Rate: Object, Codable {
    @objc dynamic var Source: String = ""
    @objc dynamic var Value: String = ""
}
