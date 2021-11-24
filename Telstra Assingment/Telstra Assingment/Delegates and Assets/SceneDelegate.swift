//
//  SceneDelegate.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // MARK: - Making PhotoViewController as Root with Navigation
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: PhotosViewController())
        
        // MARK: - Checking internet connectivity
        
        if Reachability.isConnectedToNetwork() != true {
            
            showAlertInSceneDelegate()
        }
    }
    
    // MARK: - Show alert if network connectivity fails
    
    func showAlertInSceneDelegate() {
        
        let alertController = UIAlertController(title: Common.title, message: Common.titledescription, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: Common.okTitle, style: UIAlertAction.Style.default) { _ in }
        let cancelAction = UIAlertAction(title: Common.cancelTitle, style: UIAlertAction.Style.cancel) { _ in }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
