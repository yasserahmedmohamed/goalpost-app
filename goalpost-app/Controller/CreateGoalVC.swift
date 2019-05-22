//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var GoalTextView: UITextView!
    @IBOutlet weak var ShortTermBtn: UIButton!
    @IBOutlet weak var LongTermBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NextBtn.bindToKeyboard()
        ShortTermBtn.setSelectedColor()
        LongTermBtn.setUnselectColor()
       GoalTextView.delegate = self
        let viewtapped = UITapGestureRecognizer(target: self, action: #selector(CreateGoalVC.CloseKeyboard))
        view.addGestureRecognizer(viewtapped)
    }
    @objc func CloseKeyboard(){
        view.endEditing(true)
    }
    @IBAction func shortBtnTapped(_ sender: Any) {
        goalType = .shortTerm
        ShortTermBtn.setSelectedColor()
        LongTermBtn.setUnselectColor()
    }
    @IBAction func LongBtnTapped(_ sender: Any) {
        goalType = .longTerm
        LongTermBtn.setSelectedColor()
        ShortTermBtn.setUnselectColor()
    }
    @IBAction func nextBtnTapped(_ sender: Any) {//FinishCreateVC
        guard let description = GoalTextView.text else{return}
        
        guard let finishcreategoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishCreateVC")
            as? FinishCreateVC
            else {return}
            finishcreategoalVC.initvalue(goaldescription: description, shortOrLongTerm: goalType)
        presentViewController(finishcreategoalVC)
    }
    @IBAction func BackBtntapped(_ sender: Any) {
       dismissView()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        GoalTextView.text = ""
        GoalTextView.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    }
}


