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
        
        var lastView: UIView?
        let numViews = 3
        for i in 0 ..< numViews {
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
            
            if i == (numViews - 1) {
                pageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            }
            
//            pageView.backgroundColor = .random
            
            lastView = pageView
        }
    }
}

import AVKit

class DiscoverItemVideoView: UIView {
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer?.frame = self.bounds
    }
    
    private func setupView() {
        self.backgroundColor = .black
        
        let player = AVPlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = self.bounds
        self.layer.addSublayer(playerLayer)
        self.player = player
        self.playerLayer = playerLayer
        
        self.update(data: "")
    }
    
    private func update(data: String) {
        let videoURL = URL(string: "https://cdn.shopify.com/videos/c/o/v/d84f8d763a554aad966ecb70aac401df.mp4")!
        self.player?.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
        self.player?.play()
    }
    
}


