//
//  LessonWord.swift
//  myApp
//
//  Created by Hatto on 21/6/2564 BE.
//

import UIKit
import AVFoundation

class LessonWord: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var indexLesson:Int = Int()
    var languageVoice:String = String()
    private let englishData = DataLoader().englishData
    private let frenchData = DataLoader().frenchData
    private let japaneseData = DataLoader().japaneseData
    private let koreanData = DataLoader().koreanData
    private let iconBack:UIImageView = UIImageView()
    private let mainTitle:UILabel = UILabel()
    private let lessonName:UILabel = UILabel()
    private var tableView:UITableView = UITableView()
    
    private func setupAllUI() {
        
        //icon
        iconBack.frame = CGRect(x: 24, y: 68, width: 50, height: 50)
        iconBack.image = UIImage(named: "icon-back.png")
        iconBack.isUserInteractionEnabled = true
        view.addSubview(iconBack)
        
        //mainTitle
        mainTitle.frame = CGRect(x: 112, y: 71, width: 152, height: 44)
        mainTitle.text = "LESSON"
        mainTitle.font = UIFont(name: "Montserrat-Bold", size: 36)
        mainTitle.textColor = .white
        mainTitle.dropShadow(bound: false)
        view.addSubview(mainTitle)
        
        //lessonName
        lessonName.frame = CGRect(x: 0, y: 130, width: 375, height: 32)
        lessonName.text = "\(japaneseData[indexLesson].lessonName)"
        lessonName.font = UIFont(name: "Montserrat-Bold", size: 26)
        lessonName.textColor = .white
        lessonName.textAlignment = .center
        lessonName.dropShadow(bound: false)
        view.addSubview(lessonName)
        
        //tableView
        view.backgroundColor = UIColor.init(rgb: 0xFFFCE0)
        
        tableView = UITableView(frame: CGRect(x: 0,
                                              y: 182,
                                              width: UIScreen.main.bounds.width,
                                              height: 630))
        tableView.register(UINib.init(nibName: "LessonWordCustomCell", bundle: nil), forCellReuseIdentifier: "LessonWordCustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.dropShadow(bound: false)
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
        
        if languageVoice == "english" {
            let utterance = AVSpeechUtterance(string: "\(englishData[self.indexLesson].word[indexPath.row])")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.4
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
        else if languageVoice == "french" {
            let utterance = AVSpeechUtterance(string: "\(frenchData[self.indexLesson].word[indexPath.row])")
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
            utterance.rate = 0.4
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
        else if languageVoice == "japanese" {
            let utterance = AVSpeechUtterance(string: "\(japaneseData[self.indexLesson].word[indexPath.row])")
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            utterance.rate = 0.4
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
        else {
            let utterance = AVSpeechUtterance(string: "\(koreanData[self.indexLesson].word[indexPath.row])")
            utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
            utterance.rate = 0.4
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
        if let cell = tableView.cellForRow(at: indexPath) as? LessonWordCustomCell {
            view.animateViewBtn(cell)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNumber = 0
        if languageVoice == "english" {
            rowNumber = englishData[indexLesson].word.count
        }
        else if languageVoice == "french" {
            rowNumber = frenchData[indexLesson].word.count
        }
        else if languageVoice == "japanese" {
            rowNumber = japaneseData[indexLesson].word.count
        }
        else if languageVoice == "korean"{
            rowNumber = japaneseData[indexLesson].word.count
        }
        else {
            print("error")
        }
        return rowNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //readData
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonWordCustomCell" , for: indexPath) as! LessonWordCustomCell
        if languageVoice == "english" {
            cell.lbWord.text = englishData[self.indexLesson].word[indexPath.row]
            cell.lbReading.text = ""
            cell.lbMeaning.text = englishData[self.indexLesson].meanings[indexPath.row]
        }
        else if languageVoice == "french" {
            cell.lbWord.text = frenchData[self.indexLesson].word[indexPath.row]
            cell.lbReading.text = frenchData[self.indexLesson].reading[indexPath.row]
            cell.lbMeaning.text = frenchData[self.indexLesson].meanings[indexPath.row]
        }
        else if languageVoice == "japanese" {
            cell.lbWord.text = japaneseData[self.indexLesson].word[indexPath.row]
            cell.lbReading.text = japaneseData[self.indexLesson].reading[indexPath.row]
            cell.lbMeaning.text = japaneseData[self.indexLesson].meanings[indexPath.row]
        }
        else if languageVoice == "korean"{
            cell.lbWord.text = koreanData[self.indexLesson].word[indexPath.row]
            cell.lbReading.text = koreanData[self.indexLesson].reading[indexPath.row]
            cell.lbMeaning.text = koreanData[self.indexLesson].meanings[indexPath.row]
        }
        else {
            print("error")
        }
        //custom
        cell.lbWord.textColor = .black
        cell.lbReading.textColor = UIColor.init(rgb: 0x7BAB99)
        cell.lbMeaning.textColor = .black
        cell.backgroundColor = .clear
        let selectedColor = UIView()
        selectedColor.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = selectedColor
        //animate
        cell.frame.origin.x = -cell.frame.width
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            cell.frame.origin.x = 0
        }, completion: nil)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllUI()
    }
    
}
