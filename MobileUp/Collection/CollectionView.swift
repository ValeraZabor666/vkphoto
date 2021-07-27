//
//  CollectionView.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

protocol CollectionViewControllerProtocol {
    var presenter: CollectionPresenterProtocol? { get set }
}

class CollectionViewController: UIViewController, CollectionViewControllerProtocol {
    
    var presenter: CollectionPresenterProtocol?
    
    
    
}
