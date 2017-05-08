//
//  Subject.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 4/30/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class Subject {
    var title: String
    var image: UIImage
    var desc: String
    var questions:[question]?
    
    init(_ title: String,_ image: UIImage,_ desc: String,_ questions: [question]?) {
        self.title = title
        self.image = image
        self.desc = desc
        self.questions = questions
    }
//    init(_ title: String,_ image: UIImage,_ desc: String) {
//        self.title = title
//        self.image = image
//        self.desc = desc
//    }
}

class question {
    
    var text: String
    var answer: Int
    var answers: [String]
    var answerText: String
    
    init(_ text: String,_ answer: Int,_ answers:[String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
        self.answerText = answers[answer-1]
    }
}

struct currentGame{
    static var subject: Subject? = nil
    static var question: question? = nil
    static var guess: String? = ""
    static var correct: Bool = false
    static var buttonSelected: UIButton!
    static var score = 0
    static var gamesPlayed = 0
/*
    init(_ subject: Subject,_ question: question,_ guess: String?) {
        self.subject = subject
        self.question = question
        self.guess = guess
    }
    func isCorrect() -> Bool {
        return question.answers[question.answer] == guess!
    }*/
}
