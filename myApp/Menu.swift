//
//  Menu.swift
//  myApp
//
//  Created by Hatto on 21/6/2564 BE.
//

import UIKit

class Menu: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var whatLanguage:String = String()
    
    private let iconBack:UIImageView = UIImageView()
    private let mainTitle:UILabel = UILabel()
    private var collectionView: UICollectionView?
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

    
    private func setupAllUI() {
        //icon
        iconBack.frame = CGRect(x: 23, y: 75, width: 50, height: 50)
        iconBack.image = UIImage(named: "icon-back.png")
        iconBack.isUserInteractionEnabled = true
        view.addSubview(iconBack)
    
        //mainTitle
        mainTitle.frame = CGRect(x: 135, y: 78, width: 106, height: 44)
        mainTitle.text = "Mode"
        mainTitle.font = UIFont(name: "Montserrat-Bold", size: 36)
        mainTitle.textColor = .white
        mainTitle.dropShadow(bound: false)
        view.addSubview(mainTitle)
        
        //collectionView
        layout.sectionInset = UIEdgeInsets(top: 31, left: 38, bottom: 30, right: 37)
        layout.itemSize = CGSize(width: 300, height: 580)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.frame = CGRect(x: 0, y: 144, width: 375, height: 641)
        view.addSubview(collectionView)
        
        //bgGradient
        let gradientLy = CAGradientLayer()
        gradientLy.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        gradientLy.colors = [
            UIColor.init(rgb: 0x7BAB99).cgColor,
            UIColor.init(rgb: 0xE8D7B2).cgColor
        ]
        view.layer.insertSublayer(gradientLy, at: 0)
        
        //addTarget
        let back = UITapGestureRecognizer(target: self, action: #selector(back(_:)))
        iconBack.addGestureRecognizer(back)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = Lesson(nibName: "Lesson", bundle: nil)
            vc.keepLanguage = whatLanguage
            presentInFullScreen(vc, animated: true)
        }
        else {
            print("game")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath)
        
        if indexPath.row == 0 {
            let background = UIImage(named: "Lesson_Card.png")
            var imageView : UIImageView!
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: myCell.bounds.width, height: myCell.bounds.height))
            imageView.clipsToBounds = true
            imageView.image = background
            myCell.addSubview(imageView)
        }
        else {
            let background = UIImage(named: "Game_Card.png")
            var imageView : UIImageView!
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: myCell.bounds.width, height: myCell.bounds.height))
            imageView.clipsToBounds = true
            imageView.image = background
            myCell.addSubview(imageView)
        }
        
        myCell.layer.cornerRadius = 25
        myCell.dropShadow(bound: false)
        myCell.alpha = 0
        myCell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.25, animations: {
                myCell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
        return myCell
    }
    
    @objc private func back(_ sender : UITapGestureRecognizer) {
        view.animateViewBtn(iconBack)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllUI()
        print("Menu : \(whatLanguage)")
        // Do any additional setup after loading the view.
    }

}
