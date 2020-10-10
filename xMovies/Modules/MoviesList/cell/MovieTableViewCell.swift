//
//  MovieTableViewCell.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        contentView.backgroundColor = .systemGray4
        
        self.backgroundColor = .clear
    }
    
    func set(movie: Movie) {
        let url = URL(string: movie.Poster)
        imageMovie.kf.setImage(with: url)
        labelName.text = movie.Title
        labelYear.text = movie.Year
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
