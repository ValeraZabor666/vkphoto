//
//  LoginInteractor.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol? { get set }
}

class LoginInteractor: LoginInteractorProtocol{
    
    
    var presenter: LoginPresenterProtocol?
    
}
