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
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        let imageURL: URL = data.url
        print(imageURL)
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)!
                }
            }
        }
    }
    
    func setImage() {
        AllData.sharedData.image = image.image
    }
}
