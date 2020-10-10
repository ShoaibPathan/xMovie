//
//  MovieRepositoryProtocol.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieRepositoryProtocol {
    func getMoviesList(word: String) -> Observable<RepositoryResponse<MovieList>>
    func getMovieDetail(imdbCode: String) -> Observable<RepositoryResponse<MovieDetail>>
}
