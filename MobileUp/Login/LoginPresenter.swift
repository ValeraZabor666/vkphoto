//
//  LoginPresenter.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol LoginPresenterProtocol {
    var router: LoginRouterProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var view: LoginViewControllerProtocol? { get set }
    func authentication()
}

class LoginPresenter: LoginPresenterProtocol {
    
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?
    var view: LoginViewControllerProtocol?
    
    func authentication() {
        <#code#>
    }
}
