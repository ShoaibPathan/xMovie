//
//  MovieRepository.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MovieRepository: MovieRepositoryProtocol {
    let movieRestRepository = MovieRestRepository()
    let movieDBRepository = MovieDBRepository()
    
    func getMoviesList(word: String) -> Observable<RepositoryResponse<MovieList>>{
        return movieDBRepository.getMoviesList(word: word)
    }
    
    func getMovieDetail(imdbCode: String) -> Observable<RepositoryResponse<MovieDetail>> {
        return movieDBRepository.getMovieDetail(imdbCode: imdbCode)
    }
}
