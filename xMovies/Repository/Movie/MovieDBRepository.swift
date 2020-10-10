//
//  MovieDBRepository.swift
//  xMovies
//
//  Created by DIAKO on 10/8/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa


class MovieDBRepository: MovieRepositoryProtocol {
    
    func getMoviesList(word: String) -> Observable<RepositoryResponse<MovieList>> {
        
        return Observable.create({observer -> Disposable in
            let realm = try! Realm()
            let movies = realm.objects(MovieList.self).first
            observer.onNext(RepositoryResponse(value: movies))
            return Disposables.create()
        })
    }
    
    func getMovieDetail(imdbCode: String) -> Observable<RepositoryResponse<MovieDetail>> {
        
        return Observable.create({observer -> Disposable in
            let realm = try! Realm()
            let movie = realm.objects(MovieDetail.self)
            for m in movie {
                if m.imdbID == imdbCode {
                    observer.onNext(RepositoryResponse(value: m))
                }
            }
            
            
            return Disposables.create()
        })
    }
    
    func saveMovieList(model: MovieList) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(model)
            let folderPath = realm.configuration.fileURL!
            print(folderPath)
        }
    }
    
    func saveMovieDetail(model: MovieDetail) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(model)
        }
    }
}
