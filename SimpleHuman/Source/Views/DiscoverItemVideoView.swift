//
//  DiscoverItemVideoView.swift
//  ©️ 2023 0100
//

import UIKit
import AVKit

class DiscoverItemVideoView: UIView {
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var productLabel: UILabel?
    private var ctaButton: UIButton?
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer?.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 3)
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        let player = AVPlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.backgroundColor = UIColor.black.cgColor
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 3)
        self.layer.addSublayer(playerLayer)
        self.player = player
        self.playerLayer = playerLayer
        
        let productLabel = UILabel()
        productLabel.numberOfLines = 0
        productLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        self.addSubview(productLabel)
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        productLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        productLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.productLabel = productLabel
                
        var config = UIButton.Configuration.plain()
        config.title = "shop now"
        config.titleAlignment = .center
        config.titlePadding = 10.0
        config.baseForegroundColor = .white
        config.background.backgroundColor = .clear
        config.background.strokeColor = .systemRed
        config.background.strokeWidth = 1
        let button = UIButton(configuration: config)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: productLabel.topAnchor, constant: -15).isActive = true
        button.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor).isActive = true
        self.ctaButton = button
    }
    
    public func update(item: DiscoverItem) {
        if let videoURL = item.videoURL {
            self.player?.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
            self.player?.play()
            self.loopVideo(videoPlayer: self.player)
        }
        
        self.productLabel?.text = item.productTextBlock?.text
        self.productLabel?.textColor = UIColor(hex: item.productTextBlock?.style.textColor)
        self.productLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: item.productTextBlock?.style.fontSize ?? 0)
        
        self.ctaButton?.configuration?.baseForegroundColor = UIColor(hex: item.ctaTextBlock?.style.textColor)
        self.ctaButton?.configuration?.background.strokeColor = UIColor(hex: item.ctaTextBlock?.style.borderColor)
        self.ctaButton?.configuration?.attributedTitle = AttributedString(item.ctaTextBlock?.text ?? "", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "HelveticaNeue", size: item.ctaTextBlock?.style.fontSize ?? 0)!]))
    }
    
    func loopVideo(videoPlayer: AVPlayer?) {
        guard let videoPlayer = videoPlayer else { return }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }
    
    
}


