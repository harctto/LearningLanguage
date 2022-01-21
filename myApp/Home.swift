//
//  HomeViewController.swift
//  myApp
//
//  Created by Hatto on 20/6/2564 BE.
//

import UIKit

class Home: UIViewController {

    private var titleMain:UILabel = UILabel()
    
    private var englishView:UIButton = UIButton()
    private var englishTitle:UILabel = UILabel()
    private var englishIcon:UIImageView = UIImageView()
    
    private var frenchView:UIButton = UIButton()
    private var frenchTitle:UILabel = UILabel()
    private var frenchIcon:UIImageView = UIImageView()
    
    private var japaneseView:UIButton = UIButton()
    private var japaneseTitle:UILabel = UILabel()
    private var japaneseIcon:UIImageView = UIImageView()
    
    private var koreanView:UIButton = UIButton()
    private var koreanTitle:UILabel = UILabel()
    private var koreanIcon:UIImageView = UIImageView()

    private func setupAllUI() {
        //customView
        titleMain = UILabel(frame: CGRect(x: 93, y: 70, width: 190, height: 44))
        titleMain.font = UIFont(name: "Montserrat-Bold", size: 36)
        titleMain.textColor = .white
        titleMain.text = "Language"
        titleMain.dropShadow(bound: false)
        view.addSubview(titleMain)
        
        //englishView
        englishView.frame = CGRect(x: 24, y: 144, width: 328, height: 130)
        englishView.layer.cornerRadius = 25
        englishView.dropShadow(bound: false)
        englishView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        englishView.isUserInteractionEnabled = true
        englishView.alpha = 0
        englishView.fadeIn(duration: 0.5, delay: 0)
        //
        englishTitle.frame = CGRect(x: 46, y: 186, width: 137, height: 44)
        englishTitle.text = "English"
        englishTitle.font = UIFont(name: "Montserrat-Medium", size: 36)
        englishTitle.textColor = UIColor.init(red: 0.254, green: 0.254, blue: 0.254, alpha: 0.75)
        englishTitle.alpha = 0
        englishTitle.dropShadow(bound: false)
        englishTitle.fadeIn(duration: 0.5, delay: 0)
        //
        englishIcon.frame = CGRect(x: 266, y: 177, width: 64, height: 64)
        englishIcon.image = UIImage(named: "flag-us")
        englishIcon.alpha = 0
        englishIcon.dropShadow(bound: false)
        englishIcon.fadeIn(duration: 0.5, delay: 0)
        view.addSubview(englishView)
        view.addSubview(englishTitle)
        view.addSubview(englishIcon)
        
        //frenchView
        frenchView.frame = CGRect(x: 24, y: 298, width: 328, height: 130)
        frenchView.layer.cornerRadius = 25
        frenchView.dropShadow(bound: false)
        frenchView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        frenchView.isUserInteractionEnabled = true
        frenchView.alpha = 0
        frenchView.fadeIn(duration: 0.5, delay: 0.25)
        //
        frenchTitle.frame = CGRect(x: 46, y: 340, width: 129, height: 44)
        frenchTitle.text = "French"
        frenchTitle.font = UIFont(name: "Montserrat-Medium", size: 36)
        frenchTitle.textColor = UIColor.init(red: 0.254, green: 0.254, blue: 0.254, alpha: 0.75)
        frenchTitle.alpha = 0
        frenchTitle.dropShadow(bound: false)
        frenchTitle.fadeIn(duration: 0.5, delay: 0.25)
        //
        frenchIcon.frame = CGRect(x: 266, y: 330, width: 64, height: 64)
        frenchIcon.image = UIImage(named: "flag-fr")
        frenchIcon.alpha = 0
        frenchIcon.dropShadow(bound: false)
        frenchIcon.fadeIn(duration: 0.5, delay: 0.25)
        view.addSubview(frenchView)
        view.addSubview(frenchTitle)
        view.addSubview(frenchIcon)
        
        //japaneseView
        japaneseView.frame = CGRect(x: 24, y: 450, width: 328, height: 130)
        japaneseView.layer.cornerRadius = 25
        japaneseView.dropShadow(bound: false)
        japaneseView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        japaneseView.isUserInteractionEnabled = true
        japaneseView.alpha = 0
        japaneseView.fadeIn(duration: 0.5, delay: 0.5)
        //
        japaneseTitle.frame = CGRect(x: 46, y: 495, width: 173, height: 44)
        japaneseTitle.text = "Japanese"
        japaneseTitle.font = UIFont(name: "Montserrat-Medium", size: 36)
        japaneseTitle.textColor = UIColor.init(red: 0.254, green: 0.254, blue: 0.254, alpha: 0.75)
        japaneseTitle.alpha = 0
        japaneseTitle.dropShadow(bound: false)
        japaneseTitle.fadeIn(duration: 0.5, delay: 0.5)
        //
        japaneseIcon.frame = CGRect(x: 266, y: 485, width: 64, height: 64)
        japaneseIcon.image = UIImage(named: "flag-jp")
        japaneseIcon.alpha = 0
        japaneseIcon.dropShadow(bound: false)
        japaneseIcon.fadeIn(duration: 0.5, delay: 0.5)
        view.addSubview(japaneseView)
        view.addSubview(japaneseTitle)
        view.addSubview(japaneseIcon)
                
        //koreanView
        koreanView.frame = CGRect(x: 24, y: 606, width: 328, height: 130)
        koreanView.layer.cornerRadius = 25
        koreanView.dropShadow(bound: false)
        koreanView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        koreanView.isUserInteractionEnabled = true
        koreanView.alpha = 0
        koreanView.fadeIn(duration: 0.5, delay: 0.75)
        //
        koreanTitle.frame = CGRect(x: 46, y: 649, width: 130, height: 44)
        koreanTitle.text = "Korean"
        koreanTitle.font = UIFont(name: "Montserrat-Medium", size: 36)
        koreanTitle.textColor = UIColor.init(red: 0.254, green: 0.254, blue: 0.254, alpha: 0.75)
        koreanTitle.alpha = 0
        koreanTitle.dropShadow(bound: false)
        koreanTitle.fadeIn(duration: 0.5, delay: 0.75)
        //
        koreanIcon.frame = CGRect(x: 266, y: 640, width: 64, height: 64)
        koreanIcon.image = UIImage(named: "flag-kr")
        koreanIcon.alpha = 0
        koreanIcon.dropShadow(bound: false)
        koreanIcon.fadeIn(duration: 0.5, delay: 0.75)
        view.addSubview(koreanView)
        view.addSubview(koreanTitle)
        view.addSubview(koreanIcon)

        //bgColorGradient
        let gradientLy = CAGradientLayer()
        gradientLy.frame = self.view.bounds
        gradientLy.colors = [
            UIColor.init(rgb: 0xEDAF97).cgColor,
            UIColor.init(rgb: 0xE8D7B2).cgColor,
            UIColor.init(rgb: 0x7BAB99).cgColor
        ]
        view.layer.insertSublayer(gradientLy, at: 0)
        
        //addTarget
        let englishTap = UITapGestureRecognizer(target: self, action: #selector(nextPageEnglish(_:)))
        englishView.addGestureRecognizer(englishTap)
        let frenchTap = UITapGestureRecognizer(target: self, action: #selector(nextPageFrench(_:)))
        frenchView.addGestureRecognizer(frenchTap)
        let japanTap = UITapGestureRecognizer(target: self, action: #selector(nextPageJapan(_:)))
        japaneseView.addGestureRecognizer(japanTap)
        let koreanTap = UITapGestureRecognizer(target: self, action: #selector(nextPageKorean(_:)))
        koreanView.addGestureRecognizer(koreanTap)
        
    }
    
    @objc private func nextPageEnglish(_ sender : UITapGestureRecognizer) {
        let vc = Menu(nibName: "Menu", bundle: nil)
        vc.whatLanguage = "english"
        presentInFullScreen(vc, animated: true)
        view.animateViewBtn(englishView)
        view.animateViewBtn(englishTitle)
        view.animateViewBtn(englishIcon)
    }
    
    @objc private func nextPageFrench(_ sender : UITapGestureRecognizer) {
        let vc = Menu(nibName: "Menu", bundle: nil)
        vc.whatLanguage = "french"
        presentInFullScreen(vc, animated: true)
        view.animateViewBtn(frenchView)
        view.animateViewBtn(frenchTitle)
        view.animateViewBtn(frenchIcon)
    }
    
    @objc private func nextPageJapan(_ sender : UITapGestureRecognizer) {
        let vc = Menu(nibName: "Menu", bundle: nil)
        vc.whatLanguage = "japanese"
        presentInFullScreen(vc, animated: true)
        view.animateViewBtn(japaneseView)
        view.animateViewBtn(japaneseTitle)
        view.animateViewBtn(japaneseIcon)
    }
    
    @objc private func nextPageKorean(_ sender : UITapGestureRecognizer) {
        let vc = Menu(nibName: "Menu", bundle: nil)
        vc.whatLanguage = "korean"
        presentInFullScreen(vc, animated: true)
        view.animateViewBtn(koreanView)
        view.animateViewBtn(koreanTitle)
        view.animateViewBtn(koreanIcon)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllUI()
    }
}
