//
//  dataLoader.swift
//  myApp
//
//  Created by Hatto on 12/6/2564 BE.
//

import Foundation

public class DataLoader {
    @Published var englishData = [dataLessonEnglish]()
    @Published var frenchData = [dataLessonFrench]()
    @Published var japaneseData = [dataLessonJapanese]()
    @Published var koreanData = [dataLessonKorean]()
    
    init() {
        loadEnglishJSON()
        loadFrenchJSON()
        loadJapanJSON()
        loadKoreanJSON()
    }
    
    func loadEnglishJSON() {
        if let fileLocation = Bundle.main.url(forResource: "EnglishData", withExtension: "json") {
            do {
                let path = try Data(contentsOf: fileLocation)
                let dataFromJson = try JSONDecoder().decode([dataLessonEnglish].self, from: path)
                
                self.englishData = dataFromJson
            } catch {
                print("error loading data")
            }
        }
    }
    
    func loadFrenchJSON() {
        if let fileLocation = Bundle.main.url(forResource: "FrenchData", withExtension: "json") {
            do {
                let path = try Data(contentsOf: fileLocation)
                let dataFromJson = try JSONDecoder().decode([dataLessonFrench].self, from: path)
                
                self.frenchData = dataFromJson
            } catch {
                print("error loading data")
            }
        }
    }
    
    func loadJapanJSON() {
        if let fileLocation = Bundle.main.url(forResource: "JapaneseData", withExtension: "json") {
            do {
                let path = try Data(contentsOf: fileLocation)
                let dataFromJson = try JSONDecoder().decode([dataLessonJapanese].self, from: path)
                
                self.japaneseData = dataFromJson
            } catch {
                print("error loading data")
            }
        }
    }
    
    func loadKoreanJSON() {
        if let fileLocation = Bundle.main.url(forResource: "KoreanData", withExtension: "json") {
            do {
                let path = try Data(contentsOf: fileLocation)
                let dataFromJson = try JSONDecoder().decode([dataLessonKorean].self, from: path)
                
                self.koreanData = dataFromJson
            } catch {
                print("error loading data")
            }
        }
    }
    
    
//    func sortJSON() {
//        self.japaneseData = self.japaneseData.sorted(by: { $0.lessonName < $1.lessonName })
//    }
}
