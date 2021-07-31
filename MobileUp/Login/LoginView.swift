//
//  LoginView.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit
import SnapKit

protocol LoginViewControllerProtocol {
    var presenter: LoginPresenterProtocol? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    var presenter: LoginPresenterProtocol?
    private var loginButton = UIButton()
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        setAppearance()
        setButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    private func setAppearance() {
        view.backgroundColor = .darkGray
    }
    
    private func setButton() {
        loginButton.backgroundColor = .lightGray
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    @objc func loginAction() {
        authService.wakeUpSession()
//        presenter?.authentication()
    }
    
    private func setConstraints() {
        loginButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.width.equalTo(view.frame.width / 2.5)
            maker.height.equalTo(view.frame.height / 5)
        }
    }
    
}
