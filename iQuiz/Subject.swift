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
    var description: String
    
    init(_ title: String,_ image: UIImage,_ description: String) {
        self.title = title
        self.image = image
        self.description = description
    }
}

class Node {
    var question: String
    var next: Node?
    var wrong1: String
    var wrong2: String
    var wrong3: String
    var correct: String
    
    init(_ question: String,_ wrong1: String,_ wrong2: String,_ wrong3: String,_ correct: String) {
        self.question = question
        self.wrong1 = wrong1
        self.wrong2 = wrong2
        self.wrong3 = wrong3
        self.correct = correct
    }
    init(_ question: String,_ wrong1: String,_ wrong2: String,_ wrong3: String,_ correct: String,_ next: Node) {
        self.question = question
        self.wrong1 = wrong1
        self.wrong2 = wrong2
        self.wrong3 = wrong3
        self.correct = correct
        self.next = next
    }
}

class MathematicsList {
    var questions: Node
    
    init(_ node: Node) {
        questions = node
    }
    func update(_ node: Node) {
        node.next = questions
        questions = node
    }
}
class MarvelList {
    var questions: Node
    
    init(_ node: Node) {
        questions = node
    }
    func update(_ node: Node) {
        node.next = questions
        questions = node
    }
}
class ScienceList {
    var questions: Node
    
    init(_ node: Node) {
        questions = node
    }
    func update(_ node: Node) {
        node.next = questions
        questions = node
    }
}
