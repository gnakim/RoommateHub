//
//  TaskListTableViewController.swift
//  RoommateHub
//
//  Created by Geena Kim on 12/4/19.
//  Copyright © 2019 Jeremy Hsu. All rights reserved.
//
/*
import UIKit
import FirebaseDatabase

class TaskListTableViewController: UITableViewController {
    
    var tasks : [Task] = []
    var roomIdentifier: String? = nil

    override func viewDidLoad() {
        tasks = createTask()
        
        let ref = Database.database().reference()
        
        ref.child(roomIdentifier!).child("tasks").observe(.value, with: { (snapshot) in
            // Get NSDictionary of user profiles
            let roommateProfiles = snapshot.value as? NSDictionary
            
            // Unwrap roommateProfiles
            guard let profiles = roommateProfiles else { return }
            
            // Iterate through NSDictionary
            for (key, value) in profiles {
                // Cast profile as a Swift Dictionary
                let profileDict = (value as! [String : Any])
                print(profileDict)
                
                // Unwrap each property of profile
                guard let name = profileDict["name"] else { return }
                guard let important = profileDict["important"] else { return }
                                
                // Append new Roommate to result Array
                self.tasks.append(Task(
                    name: name as! String,
                    important: important as! String
                ))
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }

}
*/
import UIKit
import FirebaseDatabase

class TaskListTableViewController: UITableViewController {
    
    var tasks : [Task] = []
    var database = Database.database();
    var roomIdentifier: String? = nil
    let ref = Database.database().reference()



    override func viewDidLoad() {
        super.viewDidLoad()
        //let ref = Database.database().reference() //pointer to database
        /*
        database().ref("Task").set({
          name: name,
          important: important
        });
        */
        //tasks = createTask()
    }

    // MARK: - Table view data source
    
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        // Configure the cell...
        let task = tasks[indexPath.row]
        //cell.textLabel?.text = task.name
        
        if task.important == "true" {
            cell.textLabel?.text = "* " + task.name + " *"
        }
        else{
            cell.textLabel?.text = " " + task.name
        }
        
        //print("fill in works")
        return cell
    }
    
    
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "isCompleted", sender: task)
    }
 */
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let addingVC = segue.destination as! TaskAddViewController
        addingVC.prevVC = self
    }
    

}

