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
    
    func setview(description : String , type : GoalType , goalprogress : Int){
        self.GoalDescriptionLbl.text = description
        self.GoalTypeLbl.text = type.rawValue
        self.GoalProgressLbl.text = String(describing: goalprogress)
    }
    


}
