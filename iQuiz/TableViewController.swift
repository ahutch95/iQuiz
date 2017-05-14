
//
//  TableViewController.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 4/30/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var subjects = [Subject]()
    var images = [UIImage(named: "Science"), UIImage(named: "Marvel"), UIImage(named: "Mathematics")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)

        getJson()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }

    func getJson() {
        let task = URLSession.shared.dataTask(with: URL(string: link.jsonURL)!) { (data, response, error) -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                
                guard let subjects = json as? [[String : Any]] else {return}
                
                
                for s in subjects{
                    let title = s["title"] as! String
                    print(title)
                    let desc = s["desc"] as! String
                    var genQuestion : [question] = []
                    let questions = s["questions"]
                    for q in questions as! [[String:Any]]{
                        let text = q["text"] as! String
                        let answerInt = q["answer"] as! String
                        let choices = q["answers"] as! [String]
                        
                        let aQuestion = question(text, Int(answerInt)!, choices)
                        genQuestion.append(aQuestion)
                    }
                    self.subjects.append(Subject(title, desc, genQuestion))
                    
                }
            } catch {
                print("Error Response! \n\(error)")
            }
        }
        task.resume()
    }
    
//    func loadSubjects() {
//        let subImg1 = UIImage(named: "Mathematics")
//        let subImg2 = UIImage(named: "Marvel")
//        let subImg3 = UIImage(named: "Science")
//        
//        let mQ1 = question("Who is Iron Man?", 1, ["Tony Stark","Obadiah Stane","A rock hit by Megadeth","Nobody knows"])
//        
//        let m = [mQ1]
//        let sub1 = Subject("Mathematics", subImg1!, "Quizzes about Mathematics", nil)
//        let sub2 = Subject("Marvel", subImg2!, "Quizzes about Marvel Comics", m)
//        let sub3 = Subject("Science", subImg3!, "Quizzes about Science", nil)
//        
//        subjects += [sub1, sub2, sub3]
//    }

    @IBAction func settingsButton(_ sender: Any) {
        
        let alertController : UIAlertController = UIAlertController(title: "Alert!", message: "Settings go here.", preferredStyle: .alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil )
        
        alertController.addAction(okAction)
        
        alertController.addTextField{ (textField: UITextField!) -> Void in
            textField.placeholder = "New JSON link"
        }
        
        let retrieveAction : UIAlertAction = UIAlertAction(title: "Check Now", style: .cancel, handler: {[weak self]
            (paramAction:UIAlertAction!) in
            if let textFields = alertController.textFields {
                let theTextFields = textFields as [UITextField]
                let enteredText = theTextFields[0].text
                if enteredText != nil {
                    link.jsonURL = enteredText!
                } else {
                    link.jsonURL = "http://tednewardsandbox.site44.com/questions.json"
                }
                self!.tableView.reloadData()
            }
        })
        
        alertController.addAction(retrieveAction)
        self.present(alertController, animated: true) {
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectTableViewCell", for: indexPath) as! SubjectTableViewCell

        // Configure the cell...
        let cellSubject = subjects[indexPath.row]
        
        cell.subjectTitle.text = cellSubject.title
        cell.subjectImage.image = images[indexPath.row]
        cell.subjectDesc.text = cellSubject.desc

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentGame.subject = subjects[indexPath.row]
        performSegue(withIdentifier: "S2Q", sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
