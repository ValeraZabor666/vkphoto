//
//  CollectionPresenter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol CollectionPresenterProtocol {
    var router: CollectionRouterProtocol? { get set }
    var interactor: CollectionInteractorProtocol? { get set }
    var view: CollectionViewControllerProtocol? { get set }
    
    func getPhotos()
    func openPhoto()
    func uploadPhoto(photos: Response)
}

class CollectionPresenter: CollectionPresenterProtocol {
    
    var router: CollectionRouterProtocol?
    var interactor: CollectionInteractorProtocol?
    var view: CollectionViewControllerProtocol?
    
    func openPhoto() {
        router?.openPhotoScreen()
    }
    
    func getPhotos() {
        interactor?.getURL()
    }
    
    func uploadPhoto(photos: Response) {
        view?.updateCollection(collection: photos)
    }
}
