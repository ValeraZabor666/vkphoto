//
//  CollectionRouter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

typealias EntryPoint2 =  CollectionViewControllerProtocol & UIViewController

protocol CollectionRouterProtocol {
    
    var entry: EntryPoint2? { get }
    static func start() -> CollectionRouterProtocol
    
    func openPhotoScreen()
}

class CollectionRouter: CollectionRouterProtocol {
    
    var entry: EntryPoint2?
    
    static func start() -> CollectionRouterProtocol {
        let router = CollectionRouter()
        
        var view: CollectionViewControllerProtocol = CollectionViewController()
        var presenter: CollectionPresenterProtocol = CollectionPresenter()
        var interactor: CollectionInteractorProtocol = CollectionInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint2
        
        return router
    }
    
    func openPhotoScreen() {
        let vc = PhotoRouter.start()
        let destVc = vc.entry
        entry?.navigationController?.pushViewController(destVc!, animated: true)
    }
}
