//
//  CollectionInteractor.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol CollectionInteractorProtocol {
    var presenter: CollectionPresenterProtocol? { get set }
//    var entity
}

class CollectionInteractor: CollectionInteractorProtocol{
    
    
    var presenter: CollectionPresenterProtocol?
    
}
