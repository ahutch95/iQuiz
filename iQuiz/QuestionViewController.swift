//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 5/5/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    var subjectChosen: Subject!
    var questionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectChosen = currentGame.subject
        questionText.text = subjectChosen.questions![questionCount].text
        answerA.setTitle( subjectChosen.questions![questionCount].answers[0], for: .normal)
        answerB.setTitle( subjectChosen.questions![questionCount].answers[1], for: .normal)
        answerC.setTitle( subjectChosen.questions![questionCount].answers[2], for: .normal)
        answerD.setTitle( subjectChosen.questions![questionCount].answers[3], for: .normal)
        currentGame.question = subjectChosen.questions![questionCount]
        questionCount += 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        answerA.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        answerB.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        answerC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        answerD.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sender.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        currentGame.guess = sender.titleLabel!.text
        currentGame.buttonSelected = sender
    }

    @IBAction func submitChoice(_ sender: UIButton) {
        if currentGame.guess == currentGame.question!.answerText {
            currentGame.correct = true
        }
        performSegue(withIdentifier: "Q2A", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
