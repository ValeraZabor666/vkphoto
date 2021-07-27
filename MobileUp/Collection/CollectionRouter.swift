//
//  CollectionRouter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

protocol CollectionRouterProtocol {
    
    var entry: UIViewController? { get }
    static func start() -> CollectionRouterProtocol
}

class CollectionRouter: CollectionRouterProtocol {
    
    var entry: UIViewController?
    
    static func start() -> CollectionRouterProtocol {
        let router = CollectionRouter()
        
        //vip
        var view: CollectionViewControllerProtocol = CollectionViewController()
        var presenter: CollectionPresenterProtocol = CollectionPresenter()
        var interactor: CollectionInteractorProtocol = CollectionInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? UIViewController
        
        return router
    }
    
}
