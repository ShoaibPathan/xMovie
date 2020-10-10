//
//  MovieDetailViewModel.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RxSwift

class MovieDetailViewModel {
    let disposeBag = DisposeBag()
    let response = PublishSubject<MovieDetail>()
    let onShowError = PublishSubject<String>()
    
        func getMovieDetailFromDB(imdbCode: String) {
            let movieDBRepository = MovieDBRepository()
            movieDBRepository.getMovieDetail(imdbCode: imdbCode).subscribe(onNext: {[weak self] response in
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
        
        func getMovieDetailFromRest(imdbCode: String) {
            let movieRestRepository = MovieRestRepository()
            movieRestRepository.getMovieDetail(imdbCode: imdbCode).subscribe(onNext: {[weak self] response in
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
        
        func saveInDB(model: MovieDetail) {
            let movieDBRepository = MovieDBRepository()
            movieDBRepository.saveMovieDetail(model: model)
        }
    }
