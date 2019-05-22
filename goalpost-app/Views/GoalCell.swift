//
//  GoalCell.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var GoalDescriptionLbl: UILabel!
    @IBOutlet weak var GoalTypeLbl: UILabel!
    @IBOutlet weak var GoalProgressLbl: UILabel!
    @IBOutlet weak var CompleteView: UIView!
    
    func setview(goal : Goal){
        self.GoalDescriptionLbl.text = goal.goalDescription
        self.GoalTypeLbl.text = goal.goalType
        self.GoalProgressLbl.text = String(describing: goal.goalProgress)
        if  goal.goalProgress == goal.goalComplitionValue {
            self.CompleteView.isHidden = false
        }
        else{
            self.CompleteView.isHidden = true

        }
    }
    


}
