//
//  MoviesListViewModel.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RxSwift

class MoviesListViewModel {
    
    let disposeBag = DisposeBag()
    let response = PublishSubject<MovieList>()
    let onShowError = PublishSubject<String>()
    
    func getMovieListFromDB(word: String) {
        let movieDBRepository = MovieDBRepository()
        movieDBRepository.getMoviesList(word: word).subscribe(onNext: {[weak self] response in
            if response.error == nil {
                if response.value != nil {
                    self?.response.onNext(response.value!)
                }
            }
            else {
                self?.onShowError.onNext("خطای اینترنت")
            }
        }).disposed(by: disposeBag)
    }
    
    func getMovieListFromRest(word: String) {
        let movieRestRepository = MovieRestRepository()
        movieRestRepository.getMoviesList(word: word).subscribe(onNext: {[weak self] response in
            if response.error == nil {
                if response.value != nil {
                    self?.saveInDB(model: response.value!)
                    self?.response.onNext(response.value!)
                }
            }
            else {
                self?.onShowError.onNext("خطای اینترنت")
            }
        }).disposed(by: disposeBag)
    }
    
    func saveInDB(model: MovieList) {
        let movieDBRepository = MovieDBRepository()
        movieDBRepository.saveMovieList(model: model)
    }
}
