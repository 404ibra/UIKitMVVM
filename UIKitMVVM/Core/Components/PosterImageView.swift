//
//  PosterImageView.swift
//  UIKitMVVM
//
//  Created by İbrahim Aktaş on 13.02.2024.
//

import UIKit

class PosterImageView: UIImageView {
    
    var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie: MovieResult) {
        guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else { return }
        
        dataTask = NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
        }
        
        dataTask?.resume()
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
}
