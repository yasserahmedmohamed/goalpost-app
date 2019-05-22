//
//  FinishCreateVC.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/22/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class FinishCreateVC: UIViewController {

    @IBOutlet weak var CreateBtn: UIButton!
    @IBOutlet weak var PointsTxt: UITextField!
    
    var goaldescription : String!
    var shortOrLongTerm : GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // CreateBtn.bindToKeyboard()
        let tapped = UITapGestureRecognizer(target: self, action: #selector(FinishCreateVC.endTapp))
        view.addGestureRecognizer(tapped)
    }
    @objc func endTapp(){
        view.endEditing(true)
    }
    func initvalue(goaldescription : String,shortOrLongTerm : GoalType){
        self.goaldescription = goaldescription
        self.shortOrLongTerm = shortOrLongTerm
    }
    @IBAction func CreateBtnTapped(_ sender: Any) {
        self.saveGoal { (saved) in
            if saved{
                //dismiss(animated: true, completion: nil)
                let viewtopresent = storyboard?.instantiateViewController(withIdentifier: "GoalsVCSID") as! GoalsVC
                present(viewtopresent,animated: true)
            }
        }
        
    }
    @IBAction func BackBtnTapped(_ sender: Any) {
        dismissView()
    }
    func saveGoal(complition : (_ finished:Bool)->()){
        guard let managedContext = appdelegate?.persistentContainer.viewContext else{return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goaldescription
        goal.goalType = shortOrLongTerm.rawValue
        goal.goalProgress = Int32(0)
        goal.goalComplitionValue = Int32(PointsTxt.text!)!
        
        do{
           try managedContext.save()
            print("data saved")
            complition(true)
            
        }catch {
            print("error in save : \(error)")
            complition(false)
        }
        
    }
}

