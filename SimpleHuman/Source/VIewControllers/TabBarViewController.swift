//
//  TabBarViewController.swift
//  ©️ 2023 0100
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        self.delegate = self
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        }
        
        let discoverViewController = DiscoverViewController()
        let discoverNavigationController = BaseNavigationController(rootViewController: discoverViewController)
        discoverViewController.tabBarItem = TabBarItem(type: .discover)
        
        let refillViewController = UIViewController()
        let refillNavigationController = BaseNavigationController(rootViewController: refillViewController)
        refillViewController.tabBarItem = TabBarItem(type: .refill)

        let accountViewController = UIViewController()
        let accountNavigationController = BaseNavigationController(rootViewController: accountViewController)
        accountNavigationController.tabBarItem = TabBarItem(type: .account)
        
        self.viewControllers = [
            discoverNavigationController,
            refillNavigationController,
            accountNavigationController
        ]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

class TabBarItem: UITabBarItem {
    
    enum TabType {
        case discover
        case refill
        case account
        
        var title: String {
            switch self {
            case .discover: return "Discover"
            case .refill: return "Refill+"
            case .account: return "Account"
            }
        }
        
        var image: UIImage {
            switch self {
            case .discover: return UIImage.App.tabIconDiscover_Inactive
            case .refill: return UIImage.App.tabIconRefill_Inactive
            case .account: return UIImage.App.tabIconAccount_Inactive
            }
        }
        
        var selectedImage: UIImage {
            switch self {
            case .discover: return UIImage.App.tabIconDiscover_Active
            case .refill: return UIImage.App.tabIconRefill_Active
            case .account: return UIImage.App.tabIconAccount_Active
            }
        }
    }
    
    private var type: TabType?
    
    convenience init(type: TabType) {
        self.init(title: "", image: type.image, selectedImage: type.selectedImage)
        self.type = type
        self.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 0, right: 3)
    }
}
