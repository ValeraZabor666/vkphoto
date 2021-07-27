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
    
    
    
}
