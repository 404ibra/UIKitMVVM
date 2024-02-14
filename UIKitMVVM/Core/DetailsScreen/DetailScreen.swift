//
//  DetailScreen.swift
//  UIKitMVVM
//
//  Created by İbrahim Aktaş on 14.02.2024.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverViewLabel()
}

class DetailScreen: UIViewController {

    private let movie: MovieResult
    
    private let viewModel = DetailViewModel()
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overViewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
         
    }
}

extension DetailScreen: DetailScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func downloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        
        let posterWidth = CGFloat.dWidth * 0.4
        posterImageView.layer.cornerRadius = 16
        view.addSubview(posterImageView)
        posterImageView.clipsToBounds = true
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.width.equalTo(posterWidth)
            make.height.equalTo(posterWidth * 1.5)
        }
        
        posterImageView.backgroundColor = .red
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 2
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.top)
            make.left.equalTo(posterImageView.snp.right).inset(-16)
            make.right.equalToSuperview()
        }
        
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.text = movie._releaseDate
        dateLabel.textColor = .secondaryLabel
        dateLabel.font = .systemFont(ofSize: 16)
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-24)
            make.left.equalTo(posterImageView.snp.right).inset(-16)
            make.right.equalToSuperview()
        }
    }
    
    func configureOverViewLabel() {
        overViewLabel = UILabel(frame: .zero)
        view.addSubview(overViewLabel)
        
        overViewLabel.text = movie._overview
        overViewLabel.numberOfLines = 0
        overViewLabel.font = .systemFont(ofSize: 18)
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).inset(-40)
            make.left.equalTo(posterImageView.snp.left)
            make.right.equalTo(titleLabel.snp.right)
        }
    }
  
}
