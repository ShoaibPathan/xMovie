//
//  MoviesListViewController.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesListViewController: BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel = MoviesListViewModel()
    var movies: MovieList?
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel = MoviesListViewModel()
        getMovieListFromRest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getMovieListFromDB()
    }
    
    override func initUIComponent() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func bindViewModel() {
        viewModel.response.asObserver().subscribe(onNext:{[weak self] response in
            self?.movies = response
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func getMovieListFromDB() {
        viewModel.getMovieListFromDB(word: "avatar")
    }
    
    func getMovieListFromRest() {
        viewModel.getMovieListFromRest(word: "avatar")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieListToDetail" {
            let destination = segue.destination as! MovieDetailViewController
            destination.movieImdb = sender as? String
        }
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        movies?.Search.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        if let movie = movies?.Search {
            cell.set(movie: movie[indexPath.section])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        117
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "movieListToDetail", sender: movies?.Search[indexPath.section].imdbID)
    }
}


