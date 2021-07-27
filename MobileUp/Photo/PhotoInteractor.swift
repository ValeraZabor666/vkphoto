//
//  PhotoInteractor.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol PhotoInteractorProtocol {
    var presenter: PhotoPresenterProtocol? { get set }
//    var entity
}

class PhotoInteractor: PhotoInteractorProtocol{
    
    
    var presenter: PhotoPresenterProtocol?
    
}
