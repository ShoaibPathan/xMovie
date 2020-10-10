//
//  MovieDetailViewController.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailViewController: BaseViewController {
    
    @IBOutlet weak var imageTopSection: UIImageView!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelDirector: UILabel!
    @IBOutlet weak var labelWriter: UILabel!
    @IBOutlet weak var labelStars: UILabel!
    @IBOutlet weak var labelPlot: UILabel!
    
    var movieDetail: MovieDetail!
    var movieImdb: String?
    let viewModel = MovieDetailViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imdb = movieImdb {
            viewModel.getMovieDetailFromRest(imdbCode: imdb)
            
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                if let imdb = movieImdb {
//            viewModel.getMovieDetailFromRest(imdbCode: imdb)
                    viewModel.getMovieDetailFromDB(imdbCode: imdb)
        }
    }
    
    override func initUIComponent() {
        
    }
    
    override func bindViewModel() {
        viewModel.response.asObserver().subscribe(onNext:{[weak self] response in
            self?.set(movie: response)
        }).disposed(by: disposeBag)
    }
    
    func set(movie: MovieDetail) {
        movieDetail = movie
        let url = URL(string: movieDetail.Poster)
        imageTopSection.kf.setImage(with: url)
        imagePoster.kf.setImage(with: url)
        
        labelTitle.text = movieDetail.Title
        labelYear.text = movieDetail.Year
        labelDirector.text = movieDetail.Director
        labelWriter.text = movieDetail.Writer
        labelStars.text = movieDetail.Actors
        
        labelPlot.text = movieDetail.Plot
    }
    
}
