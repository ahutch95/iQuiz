//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 5/7/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = "\(currentGame.score) out of \(currentGame.gamesPlayed)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        currentGame.score = 0
        currentGame.gamesPlayed = 0
        
        performSegue(withIdentifier: "F2S", sender: self)
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
