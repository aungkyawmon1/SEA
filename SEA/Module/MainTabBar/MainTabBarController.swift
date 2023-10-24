//
//  MainTabBarController.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//
import UIKit

class MainTabBarController: UITabBarController {

    private var upperLineView: UIView!
    private var spacing: CGFloat = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .red

        
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        
        let walletVC = WalletViewController()
        let walletNav = UINavigationController(rootViewController: walletVC)
        
        let moreVC = MoreViewController()
        let moreNav = UINavigationController(rootViewController: moreVC)
        
        
        /* Create TabBar Items */
        
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "On"), selectedImage: nil)
        homeNav.tabBarItem = homeItem
        
        let walletItem = UITabBarItem(title: "Wallet", image: UIImage(named: "wallet"), selectedImage: nil)
        walletNav.tabBarItem = walletItem
        
        let moreItem = UITabBarItem(title: "More", image: UIImage(named: "On-2"), selectedImage: nil)
    
        moreNav.tabBarItem = moreItem
        
       
        let myviewControllers = [homeNav, walletNav, moreNav]
        
        self.setViewControllers(myviewControllers, animated: false)
        
    }
    

}
