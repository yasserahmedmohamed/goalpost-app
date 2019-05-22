//
//  ViewController.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
import CoreData
let appdelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    var goals : [Goal] = []
    @IBOutlet weak var GoalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GoalTableView.dataSource = self
        GoalTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      updateTableView()
    }
    
    func updateTableView(){
        self.fetch { (done) in
            if done{
                if goals.count > 0
                {
                    GoalTableView.isHidden = false
                }
                else{
                    GoalTableView.isHidden = true
                    
                }
            }
        }
    }
    @IBAction func AddGoalButtonTapped(_ sender: Any) {
        guard let CreatGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVCSID") else {return}
        presentViewController(CreatGoalVC)
    }
    
}

extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else {return UITableViewCell()}
        let goal = goals[indexPath.item]
        cell.setview(goal: goal)
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (rowaction, indexpath) in
            self.deleteGoal(ForIndexPath: indexPath)
            self.updateTableView()
            self.GoalTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal, title: "Add 1") { (rowaction, indexpath) in
            self.UpdateData( forIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        addAction.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [deleteAction,addAction,addAction,addAction]
    }
}
extension GoalsVC{
    func UpdateData(forIndexPath index : IndexPath){
         guard let managedContext = appdelegate?.persistentContainer.viewContext else{return}
        let chosenGoal = goals[index.row]
        if chosenGoal.goalProgress < chosenGoal.goalComplitionValue{
            chosenGoal.goalProgress += 1
        }
        else{
            return
        }
        do{
              try managedContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteGoal(ForIndexPath index:IndexPath)
    {
        guard let managedContext = appdelegate?.persistentContainer.viewContext else{return}
        managedContext.delete(goals[index.row])
        do{
          try  managedContext.save()
        }catch{
            print(error)
        }
    }
    func fetch(handeler : (_ finished: Bool)->())
    {
        guard let manageContext = appdelegate?.persistentContainer.viewContext else{return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do{
            goals = try manageContext.fetch(fetchRequest) as! [Goal]
            handeler(true)
        }
        catch{
            print(error)
            handeler(false)

        }
    }
}
