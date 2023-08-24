//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 김유미 on 2023/07/18.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let realAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        realAnswer = correctAnswer
    }
}
