//
//  AuthService.swift
//  MobileUp
//
//  Created by Captain Kidd on 29.07.2021.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegete: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
    func logOut()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    
    private let appId = "7913317"
    private let vkSdk: VKSdk?
    weak var delegate: AuthServiceDelegete?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        if vkSdk == nil {
            print("NIL")
        }
        super.init()
        print("VKSdk.initialize*")
        vkSdk?.register(self)
        vkSdk?.uiDelegate = self
    }
    
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFail()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        } else {
            
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
    func logOut() {
        delegate?.logOut()
    }
    
}
