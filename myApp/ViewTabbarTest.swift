//
//  ViewTabbarTest.swift
//  myApp
//
//  Created by Hatto on 20/6/2564 BE.
//

import UIKit

class ViewTabbar: UIViewController {

    @IBOutlet weak var viewForTab: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tab1: UIView!
    @IBOutlet weak var tab2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designableTabbar()
        forHome()
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func designableTabbar() {
        viewForTab.backgroundColor = UIColor.blue
        viewForTab.layer.cornerRadius = viewForTab.frame.size.height / 2
        viewForTab.clipsToBounds = false
        viewForTab.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewForTab.layer.shadowOpacity = 1
        viewForTab.layer.shadowOffset = CGSize(width: 4, height: 4)
        viewForTab.layer.shadowRadius = 8
        viewForTab.layer.shadowPath = UIBezierPath(rect: viewForTab.bounds).cgPath
        viewForTab.layer.shouldRasterize = true
        viewForTab.layer.rasterizationScale = UIScreen.main.scale
        
        tab1.layer.cornerRadius = tab1.frame.size.height / 2
        tab1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        tab2.layer.cornerRadius = tab2.frame.size.height / 2
        tab2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func forHome() {
        guard let Home = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? ViewController else {
            return
        }
        contentView.addSubview(Home.view)
        Home.didMove(toParent: Home.self)
        tab1.backgroundColor = .black
        tab2.backgroundColor = .clear
    }

    @IBAction func onClickTabBar(_ sender: UIButton) {
        print("hello")
        let tag = sender.tag
        print(tag)
        if tag == 1 {
            forHome()
        }
        else {
            guard let Settings = self.storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {
                return
            }
            contentView.addSubview(Settings.view)
            Settings.didMove(toParent: Settings.self)
            tab1.backgroundColor = .clear
            tab2.backgroundColor = .black
        }
    }
    
}
