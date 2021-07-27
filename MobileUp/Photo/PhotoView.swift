//
//  PhotoView.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

protocol PhotoViewControllerProtocol {
    var presenter: PhotoPresenterProtocol? { get set }
}

class PhotoViewController: UIViewController, PhotoViewControllerProtocol {
    
    var presenter: PhotoPresenterProtocol?
    private var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        setNavigation()
    }
    
    override func viewDidLayoutSubviews() {
        image.frame = view.bounds
    }
    
    private func setImage() {
        image.backgroundColor = .lightGray
        view.addSubview(image)
    }
    
    private func setNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(savePhoto))
    }
    
    @objc func savePhoto() {
        
    }
}
