//
//  ViewControllerExt.swift
//  goalpost-app
//
//  Created by yasser ahmed on 5/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentViewController(_ viewcontrollerToPresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey:  kCATransition)
        present(viewcontrollerToPresent,animated: false,completion: nil)
    }
    func presentSecondary(_ viewcontroller:UIViewController){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        guard let presentedVC = presentedViewController else {return}
        presentedVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition,forKey: kCATransition)
            self.present(viewcontroller,animated: false)
        }
    }
    func dismissView(){
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey:  kCATransition)

        dismiss(animated: false, completion: nil)
    }
   
}
