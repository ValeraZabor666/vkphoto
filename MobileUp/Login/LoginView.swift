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
    private var mobileUpLabel = UILabel()
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        setAppearance()
        setButton()
        setLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    private func setAppearance() {
        view.backgroundColor = .white
    }
    
    private func setLabel() {
        mobileUpLabel.backgroundColor = .white
        mobileUpLabel.textColor = .black
        mobileUpLabel.sizeToFit()
        mobileUpLabel.numberOfLines = 2
        mobileUpLabel.text = "Mobile Up\nGallery"
        mobileUpLabel.font = UIFont.systemFont(ofSize: 48)
        mobileUpLabel.font = UIFont.boldSystemFont(ofSize: 48)
        view.addSubview(mobileUpLabel)
    }
    
    private func setButton() {
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.setTitle("Вход через VK", for: .normal)
        loginButton.titleLabel?.textColor = .white
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    @objc func loginAction() {
        authService.wakeUpSession()
    }
    
    private func setConstraints() {
        loginButton.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(50)
            maker.bottom.equalToSuperview().inset(50)
            maker.height.equalTo(70)
        }
        
        mobileUpLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(70)
            maker.left.right.equalToSuperview().inset(20)
            maker.height.equalTo(250)
        }
    }
    
}
