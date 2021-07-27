//
//  LoginView.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

protocol LoginViewControllerProtocol {
    var presenter: LoginPresenterProtocol? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    var presenter: LoginPresenterProtocol?
    
    
    
}
