//
//  FirstViewController.swift
//  MoneySplit
//
//  Created by Aiqi Liu on 9/21/15.
//  Copyright (c) 2015 Aiqi Liu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    var toPass : basicInfo!
    var info  = basicInfo()
    
    
    //details for the picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let allBuyer = info.myName + info.otherNames
        return allBuyer.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let allBuyer = info.myName + info.otherNames
        
        return allBuyer[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var allBuyer = info.myName + info.otherNames
        info.selectedBuyer = allBuyer[row]
        info.rowIndex = row
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputSaved.hidden = true
        self.namePicker.delegate = self
        self.namePicker.dataSource = self
        let tbvc = self.tabBarController  as! myTabBarController
        info = tbvc.toPass
        let newSplited =  [Double](count:Int(info.numPar), repeatedValue: 0.0)
        info.splited += newSplited
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var namePicker: UIPickerView!
    @IBOutlet var itemCost: UITextField!
    @IBOutlet var inputSaved: UIView!
       @IBAction func action(sender: AnyObject) {
        let cost : Double = (itemCost.text! as NSString).doubleValue
        let mean : Double = cost/info.numPar

        //accumulate the amount of money owed to that buyer
        if (info.rowIndex > 0) {
            
            info.splited[info.rowIndex - 1] += mean
            //append the money amount to each display string
            let substringCnt:Int = (info.otherNames[info.rowIndex-1] as NSString).length + 3
            
            info.display[info.rowIndex - 1] = String((info.display[info.rowIndex - 1] as NSString).substringToIndex(substringCnt))+(String(format:"%.1f", info.splited[info.rowIndex - 1]))
                
        }
        //popup window if no cost is entered
        if cost == 0 {
            let alertController = UIAlertController(title: "Ooops!", message:
                "Please fill in the cost", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if(cost != 0){
            inputSaved.hidden = false
            inputSaved.alpha = 1.0
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
        }
        //reset picker
        namePicker.reloadAllComponents()
        //clear textField
        itemCost.text = ""
        //keyboard goes away after clciking on button
        self.itemCost.resignFirstResponder()
        //reset picker
        namePicker.reloadAllComponents()
        
        //clear textField
        itemCost.text = ""
        //keyboard goes away after clicking on button
        self.itemCost.resignFirstResponder()
    }
    
    func update() {
        //  PopUpView.hidden = true
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.inputSaved.alpha = 0.0
            }, completion: nil)
        
    }

}

