//
//  LoginRouter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

typealias EntryPoint = LoginViewControllerProtocol & UIViewController

protocol LoginRouterProtocol {
    
    var entry: EntryPoint? { get }
    static func start() -> LoginRouterProtocol
}

class LoginRouter: LoginRouterProtocol {
    
    var entry: EntryPoint?
    
    static func start() -> LoginRouterProtocol {
        let router = LoginRouter()
        
        //vip
        var view: LoginViewControllerProtocol = LoginViewController()
        var presenter: LoginPresenterProtocol = LoginPresenter()
        var interactor: LoginInteractorProtocol = LoginInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
