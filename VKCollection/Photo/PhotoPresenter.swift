//
//  PhotoPresenter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol PhotoPresenterProtocol {
    var router: PhotoRouterProtocol? { get set }
    var interactor: PhotoInteractorProtocol? { get set }
    var view: PhotoViewControllerProtocol? { get set }
}

class PhotoPresenter: PhotoPresenterProtocol {
    
    var router: PhotoRouterProtocol?
    var interactor: PhotoInteractorProtocol?
    var view: PhotoViewControllerProtocol?
    
}

