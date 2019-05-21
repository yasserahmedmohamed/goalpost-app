//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var GoalTextView: UITextView!
    @IBOutlet weak var ShortTermBtn: UIButton!
    @IBOutlet weak var LongTermBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func shortBtnTapped(_ sender: Any) {
    }
    @IBAction func LongBtnTapped(_ sender: Any) {
    }
    @IBAction func nextBtnTapped(_ sender: Any) {
    }
    @IBAction func BackBtntapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
