//
//  dataStruct.swift
//  myApp
//
//  Created by Hatto on 11/6/2564 BE.
//

import Foundation

struct dataLessonJapanese: Codable {
    let lessonName: String
    let word, reading, meanings: [String]
}

struct dataLessonFrench: Codable {
    let lessonName: String
    let word, reading, meanings: [String]
}

struct dataLessonKorean: Codable {
    let lessonName: String
    let word, reading, meanings: [String]
}

struct dataLessonEnglish: Codable {
    let lessonName: String
    let word, meanings: [String]
}
