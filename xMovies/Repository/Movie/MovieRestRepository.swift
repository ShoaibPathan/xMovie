//
//  MovieRestRepository.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import RealmSwift


class MovieRestRepository: MovieRepositoryProtocol {
    
    let movieList = PublishSubject<MovieList>()
    let disposeBag = DisposeBag()
    func getMoviesList(word: String) -> Observable<RepositoryResponse<MovieList>> {
        let apiHelper = ApiHelper.instance
        let urlComponent = apiHelper.falconURLComponentsInstance()
        var queryItems = [URLQueryItem]()
        let apikeyQuery = URLQueryItem(name: "apikey", value: ApiHelper.API_KEY)
        let query = URLQueryItem(name: "s", value: word)
        queryItems.append(apikeyQuery)
        queryItems.append(query)
        
        urlComponent.queryItems = queryItems
        return NetworkCall(parameters: [:], urlComponent: urlComponent, method: .get, isJSONRequest: false).executeCall()
    }
    
    func getMovieDetail(imdbCode: String) -> Observable<RepositoryResponse<MovieDetail>> {
        let apiHelper = ApiHelper.instance
        let urlComponent = apiHelper.falconURLComponentsInstance()
        var queryItems = [URLQueryItem]()
        let query = URLQueryItem(name: "i", value: imdbCode)
        let apikeyQuery = URLQueryItem(name: "apikey", value: ApiHelper.API_KEY)
        queryItems.append(query)
        queryItems.append(apikeyQuery)
        urlComponent.queryItems = queryItems
        return NetworkCall(parameters: [:], urlComponent: urlComponent, method: .get, isJSONRequest: false).executeCall()
    }
}
