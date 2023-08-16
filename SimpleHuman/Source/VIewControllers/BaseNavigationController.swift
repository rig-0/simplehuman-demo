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

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.App.purple,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 16)!]
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.App.purple,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)]

        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        
        let navigationBarDivider = UIView()
        navigationBarDivider.backgroundColor = .white
        self.navigationBar.addSubview(navigationBarDivider)
        navigationBarDivider.translatesAutoresizingMaskIntoConstraints = false
        navigationBarDivider.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor).isActive = true
        navigationBarDivider.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor).isActive = true
        navigationBarDivider.bottomAnchor.constraint(equalTo: self.navigationBar.bottomAnchor).isActive = true
        navigationBarDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
