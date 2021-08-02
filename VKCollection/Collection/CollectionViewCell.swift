//
//  CollectionViewCell.swift
//  MobileUp
//
//  Created by Captain Kidd on 31.07.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let id = "PhotoCell"
    
    private var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        imageView.image = UIImage(named: "loadingImage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        image.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Size) {
        image.layer.cornerRadius = 1
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        let imageURL: URL = data.url
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: imageURL)) {
            image.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            let dataTask = URLSession.shared.dataTask(with: imageURL) { [weak self] data,response,error in
                if let data = data, let response = response {
                    DispatchQueue.main.async {
                        self!.image.image = UIImage(data: data)!
                        self?.imageToCache(data: data, response: response)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func setImage() {
        AllData.sharedData.image = image.image
    }
    
    private func imageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
}
