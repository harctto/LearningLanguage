//
//  ViewController.swift
//  myApp
//
//  Created by Hatto on 11/6/2564 BE.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private let japaneseData = DataLoader().japaneseData
    private var titleMain:UILabel = UILabel()
    private var englishView:UIImageView = UIImageView()
    private var frenchView:UIImageView = UIImageView()
    private var japaneseView:UIImageView = UIImageView()
    private var koreanView:UIImageView = UIImageView()


    private func setupAllUI() {
        //customView
        titleMain = UILabel(frame: CGRect(x: 92, y: 115, width: 190, height: 44))
        titleMain.font = UIFont(name: "Montserrat-Bold", size: 36)
        titleMain.textColor = .black
        titleMain.text = "Language"
        
        englishView.frame = CGRect(x: 23, y: 265, width: 153, height: 221)
        englishView.layer.cornerRadius = 25
        englishView.image = UIImage(named: "EnglishBanner.png")
        englishView.dropShadow(bound: true)
        englishView.isUserInteractionEnabled = true
        englishView.alpha = 0
        englishView.fadeIn(duration: 0.5, delay: 0)
        
        frenchView.frame = CGRect(x: 196, y: 265, width: 153, height: 221)
        frenchView.layer.cornerRadius = 25
        frenchView.image = UIImage(named: "FrenchBanner.png")
        frenchView.dropShadow(bound: true)
        frenchView.isUserInteractionEnabled = true
        frenchView.alpha = 0
        frenchView.fadeIn(duration: 0.5, delay: 0)
        
        japaneseView.frame = CGRect(x: 23, y: 505, width: 153, height: 221)
        japaneseView.layer.cornerRadius = 25
        japaneseView.image = UIImage(named: "JapaneseBanner.png")
        japaneseView.dropShadow(bound: true)
        japaneseView.isUserInteractionEnabled = true
        japaneseView.alpha = 0
        japaneseView.fadeIn(duration: 0.5, delay: 0.5)
        
        koreanView.frame = CGRect(x: 196, y: 505, width: 153, height: 221)
        koreanView.layer.cornerRadius = 25
        koreanView.image = UIImage(named: "KoreanBanner.png")
        koreanView.dropShadow(bound: true)
        koreanView.isUserInteractionEnabled = true
        koreanView.alpha = 0
        koreanView.fadeIn(duration: 0.5, delay: 0.5)
        

        //bgColorGradient
        let gradientLy = CAGradientLayer()
        gradientLy.frame = self.view.bounds
        gradientLy.colors = [
            UIColor.init(rgb: 0xF8FFFC).cgColor,
            UIColor.init(rgb: 0xACFFFA).cgColor
        ]
        
        //addTarget
        let japanTap = UITapGestureRecognizer(target: self, action: #selector(nextPageJapan(_:)))
        japaneseView.addGestureRecognizer(japanTap)
        
        //addSubview
        view.layer.insertSublayer(gradientLy, at: 0)
        view.addSubview(titleMain)
        view.addSubview(englishView)
        view.addSubview(frenchView)
        view.addSubview(japaneseView)
        view.addSubview(koreanView)
    }
    
    @objc private func nextPageJapan(_ sender : UITapGestureRecognizer) {
        let rootVC = JapaneseVC()
        rootVC.title = "Japanese"
        let navVC = UINavigationController(rootViewController: rootVC)
        presentInFullScreen(navVC, animated: true)
        view.animateViewBtn(japaneseView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllUI()
    }

}

