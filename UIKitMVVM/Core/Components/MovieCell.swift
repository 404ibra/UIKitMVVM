//
//  MovieCell.swift
//  UIKitMVVM
//
//  Created by İbrahim Aktaş on 13.02.2024.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    func setCell(movie: MovieResult)  {
        posterImageView.downloadImage(movie: movie)
    }
    
    
    //MARK: - Life Cycles
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading() 
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieCell {
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        clipsToBounds = true
        
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        posterImageView.backgroundColor = .red
    }
}
