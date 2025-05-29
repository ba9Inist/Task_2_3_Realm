//
//  SceneDelegate.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 29.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        
//        // Создаем три ViewController
//        let firstVC = FirstViewController()
//        let secondVC = SecondViewController()
//        let thirdVC = ThirdViewController()
//
//        // Назначаем каждому ViewController его собственную иконку и название
//        firstVC.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "1.square.fill"), tag: 0)
//        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "2.square.fill"), tag: 1)
//        thirdVC.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "3.square.fill"), tag: 2)
//        
//        // Создаем TabBarController и добавляем ViewControllers
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [firstVC, secondVC, thirdVC]
//        
//        // Назначаем TabBarController как rootViewController нашего окна
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
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
    }


}

