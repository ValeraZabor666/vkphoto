//
//  SceneDelegate.swift
//  MobileUp
//
//  Created by Captain Kidd on 26.07.2021.
//

import UIKit
import VK_ios_sdk

class SceneDelegate: UIResponder, UIWindowSceneDelegate, AuthServiceDelegete {

    var window: UIWindow?
    var authService: AuthService?
    
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sd: SceneDelegate = (scene?.delegate as? SceneDelegate)!
        return sd
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        authService = AuthService()
        if authService == nil {
            print("NIL")
        }
        authService!.delegate = self
        
        let window = UIWindow(windowScene: windowScene)
        
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { (state, error) in
            switch state {
            case .authorized:
                self.authServiceSignIn()
            default:
                let loginScreenRouter = LoginRouter.start()
                let initialVC = loginScreenRouter.entry
                window.rootViewController = UINavigationController(rootViewController: initialVC!)
            }
        }
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            VKSdk.processOpen(url,
                              fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    func authServiceShouldShow(viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        let collectionScreenRouter = CollectionRouter.start()
        let collectionVC = (collectionScreenRouter.entry)!
        window?.rootViewController = UINavigationController(rootViewController: collectionVC)
    }
    
    func authServiceSignInDidFail() {
        print(#function)
    }
    
    func logOut() {
        VKSdk.forceLogout()
        let loginScreenRouter = LoginRouter.start()
        let initialVC = loginScreenRouter.entry
        window?.rootViewController = UINavigationController(rootViewController: initialVC!)

    }
    
}

