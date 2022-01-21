//
//  Lesson.swift
//  myApp
//
//  Created by Hatto on 21/6/2564 BE.
//

import UIKit

class Lesson: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var keepLanguage:String = String()
    private let englishData = DataLoader().englishData
    private let frenchData = DataLoader().frenchData
    private let japaneseData = DataLoader().japaneseData
    private let koreanData = DataLoader().koreanData
    private let iconBack:UIImageView = UIImageView()
    private let mainTitle:UILabel = UILabel()
    
    private var tableView:UITableView = UITableView()
    
    private func setupAllUI() {
        //icon
        iconBack.frame = CGRect(x: 24, y: 68, width: 50, height: 50)
        iconBack.image = UIImage(named: "icon-back.png")
        iconBack.isUserInteractionEnabled = true
        view.addSubview(iconBack)
    
        //mainTitle
        mainTitle.frame = CGRect(x: 130, y: 71, width: 116, height: 44)
        mainTitle.text = "MENU"
        mainTitle.font = UIFont(name: "Montserrat-Bold", size: 36)
        mainTitle.textColor = .white
        mainTitle.dropShadow(bound: false)
        view.addSubview(mainTitle)
        
        //tableView
        tableView = UITableView(frame: CGRect(x: 0,
                                              y: 182,
                                              width: UIScreen.main.bounds.width,
                                              height: 630))
        tableView.backgroundColor = .clear
        tableView.dropShadow(bound: false)
        tableView.rowHeight = 100
        tableView.register(LessonCustomCell.self, forCellReuseIdentifier: "lessonName")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        
        //bgGradient
        let gradientLy = CAGradientLayer()
        gradientLy.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        gradientLy.colors = [
            UIColor.init(rgb: 0xEDAF97).cgColor,
            UIColor.init(rgb: 0xE8D7B2).cgColor
        ]
        view.layer.insertSublayer(gradientLy, at: 0)
        
        //addTarget
        let back = UITapGestureRecognizer(target: self, action: #selector(back(_:)))
        iconBack.addGestureRecognizer(back)
    }
    
    @objc private func back(_ sender : UITapGestureRecognizer) {
        view.animateViewBtn(iconBack)
        dismiss(animated: true, completion: nil)
    }
    
    //table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LessonWord(nibName: "LessonWord", bundle: nil)
        vc.indexLesson = indexPath.row
        vc.languageVoice = keepLanguage
        presentInFullScreen(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countRow:Int = 0
        if keepLanguage == "english" {
            countRow = englishData.count
        }
        else if keepLanguage == "french" {
            countRow = frenchData.count
        }
        else if keepLanguage == "japanese" {
            countRow = japaneseData.count
        }
        else if keepLanguage == "korean" {
            countRow = koreanData.count
        }
        else {
            print("error")
        }
        return countRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //readData
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonName" , for: indexPath) as! LessonCustomCell
        if keepLanguage == "english" {
            cell.lbLessonName.text = englishData[indexPath.row].lessonName
        }
        else if keepLanguage == "french" {
            cell.lbLessonName.text = frenchData[indexPath.row].lessonName
        }
        else if keepLanguage == "japanese" {
            cell.lbLessonName.text = japaneseData[indexPath.row].lessonName
        }
        else if keepLanguage == "korean" {
            cell.lbLessonName.text = koreanData[indexPath.row].lessonName
        }
        else {
            print("error")
        }
        //custom
        cell.backgroundColor = .clear
        let selectedColor = UIView()
        selectedColor.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = selectedColor
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.25, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllUI()
        print("Lesson data : \(keepLanguage)")
        // Do any additional setup after loading the view.
    }
}
