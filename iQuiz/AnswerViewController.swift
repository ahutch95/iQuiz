//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 5/5/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    @IBOutlet weak var outcome: UILabel!
    var answerSelected: UIButton!
    var correctAnswer: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        if currentGame.correct {
            outcome.text = "Correct!"
            currentGame.buttonSelected.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            if answerA.titleLabel?.text ==  (currentGame.question?.answers[(currentGame.question?.answer)!])!{
                answerA.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else if answerB.titleLabel?.text ==  (currentGame.question?.answers[(currentGame.question?.answer)!])!{
                answerB.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else if answerC.titleLabel?.text ==  (currentGame.question?.answers[(currentGame.question?.answer)!])!{
                answerC.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else {
                answerD.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            }
            outcome.text = "Wrong!"
            currentGame.buttonSelected.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
