//
//  DiscoverViewController.swift
//  ©️ 2023 0100
//

import UIKit

class DiscoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "discover"
        self.tabBarItem.title = ""
        
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        let data = DiscoverFeedParser.fetch()
        var lastView: UIView?
        for item in data {
            let pageView = DiscoverItemVideoView()
            scrollView.addSubview(pageView)
            pageView.translatesAutoresizingMaskIntoConstraints = false
            pageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            pageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
            pageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            pageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            
            if let lastView = lastView {
                pageView.topAnchor.constraint(equalTo: lastView.bottomAnchor).isActive = true
            } else {
                pageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            }
            
            if item == data.last {
                pageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            }
            
            pageView.update(item: item)
            
            lastView = pageView
        }
    }
}
