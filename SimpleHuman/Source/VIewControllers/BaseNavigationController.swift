//
//  BaseNavigationController.swift
//  ©️ 2023 0100
//

import UIKit

class BaseNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 16)!]
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)]
        
//        // Customize back button
//        let backButtonBackgroundImage = UIImage.App.navBackArrow
//        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
//        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
//        appearance.backButtonAppearance = backButtonAppearance
//        appearance.setBackIndicatorImage(backButtonBackgroundImage, transitionMaskImage: backButtonBackgroundImage)

//        self.navigationBar.tintColor = .white        
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
    }
}
