//
//  DiscoverFeedScrollView.swift
//  ©️ 2023 0100
//

import UIKit

class DiscoverFeedScrollView: UIScrollView {
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.showsVerticalScrollIndicator = false
        
        let data = DiscoverFeedParser.fetch()
        var lastView: UIView?
        for item in data {
            let pageView = DiscoverItemVideoView()
            self.addSubview(pageView)
            pageView.translatesAutoresizingMaskIntoConstraints = false
            pageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            pageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            pageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            pageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            if let lastView = lastView {
                pageView.topAnchor.constraint(equalTo: lastView.bottomAnchor).isActive = true
            } else {
                pageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            }
            
            if item == data.last {
                pageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            }
            
            pageView.update(item: item)
            
            lastView = pageView
        }
    }
}
