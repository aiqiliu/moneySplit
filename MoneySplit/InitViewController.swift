//
//  InitViewController.swift
//  MoneySplit
//
//  Created by Yang Hu on 9/27/15.
//  Copyright © 2015 Aiqi Liu. All rights reserved.
//

import Foundation
import UIKit


class InitViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        popUp.hidden = true
    }

    var info = basicInfo()
    
    @IBOutlet var popUp: UIView!
    @IBOutlet weak var getName: UITextField!
    

    @IBOutlet var myName: UITextField!
    @IBAction func enterName(sender: UIButton) {
        if info.myName == [] && myName.text != ""{
        info.myName.append(myName.text!)
        }
        info.otherNames.append(getName.text!)
        info.numPar += 1
        info.display.append(getName.text! + ": $")
        popUp.hidden = false
        
        popUp.alpha = 1.0
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
        
        //keyboard goes away after clciking on button
        self.getName.resignFirstResponder()
        getName.text = ""

    }
    
    func update() {
        //  PopUpView.hidden = true
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.popUp.alpha = 0.0
            }, completion: nil)
        
    }

    
    /*
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
*/
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueTest") {
            let svc = segue!.destinationViewController as! myTabBarController
            
            svc.toPass = info
            
            
        }
    }
    
}