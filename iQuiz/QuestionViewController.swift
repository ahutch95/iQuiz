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
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    var subjectChosen: Subject!
    var questionNode: Node!
    var answerSelected: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        answerSelected = sender
    }

    @IBAction func submitChoice(_ sender: UIButton) {
        
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