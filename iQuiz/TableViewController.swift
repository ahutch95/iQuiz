
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)

        loadSubjects()
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

    func loadSubjects() {
        let subImg1 = UIImage(named: "Mathematics")
        let subImg2 = UIImage(named: "Marvel")
        let subImg3 = UIImage(named: "Science")
        
        let sub1 = Subject("Mathematics", subImg1!, "Quizzes about Mathematics")
        let sub2 = Subject("Marvel", subImg2!, "Quizzes about Marvel Comics")
        let sub3 = Subject("Science", subImg3!, "Quizzes about Science")
        
        subjects += [sub1, sub2, sub3]
    }

    @IBAction func settingsButton(_ sender: Any) {
        let settingsAlert = UIAlertController(title: "Settings", message: "Settings go here.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        settingsAlert.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            // ...
        }
        settingsAlert.addAction(OKAction)
        
        self.present(settingsAlert, animated: true) {
            // ...
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectTableViewCell", for: indexPath) as! SubjectTableViewCell

        // Configure the cell...
        let cellSubject = subjects[indexPath.row]
        
        cell.subjectTitle.text = cellSubject.title
        cell.subjectImage.image = cellSubject.image
        cell.subjectDesc.text = cellSubject.description

        return cell
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
