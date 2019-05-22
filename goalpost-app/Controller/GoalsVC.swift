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

    @IBOutlet weak var GoalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GoalTableView.dataSource = self
        GoalTableView.delegate = self
    }

    @IBAction func AddGoalButtonTapped(_ sender: Any) {
        guard let CreatGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVCSID") else {return}
        presentViewController(CreatGoalVC)
    }
    
}

extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else {return UITableViewCell()}
        cell.setview(description: "Eat Health Food", type: .longTerm, goalprogress: 1)
        
        return cell
    }
    
    
}
