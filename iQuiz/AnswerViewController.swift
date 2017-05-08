//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 5/5/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    @IBOutlet weak var outcome: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var answerSelected: UIButton!
    var correctAnswer: String = ""
    var subjectChosen: Subject!
    var questionCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = currentGame.question!.text
        answerA.setTitle( currentGame.question!.answers[0], for: .normal)
        answerB.setTitle( currentGame.question!.answers[1], for: .normal)
        answerC.setTitle( currentGame.question!.answers[2], for: .normal)
        answerD.setTitle( currentGame.question!.answers[3], for: .normal)
        if currentGame.correct {
            outcome.text = "Correct!"
            currentGame.buttonSelected.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            currentGame.score += 1
        } else {
            outcome.text = "Wrong!"
        }
        if answerA.titleLabel?.text == currentGame.question!.answerText {
            answerA.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else if answerB.titleLabel?.text == currentGame.question!.answerText {
            answerB.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else if answerC.titleLabel?.text == currentGame.question!.answerText {
            answerC.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            answerD.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        questionCount += 1
        currentGame.gamesPlayed += 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextPage(_ sender: UIButton) {
        if currentGame.gamesPlayed < (currentGame.subject?.questions?.count)! {
            performSegue(withIdentifier: "AB2Q", sender: self)
        } else {
            performSegue(withIdentifier: "A2EoG", sender: self)
        }
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
