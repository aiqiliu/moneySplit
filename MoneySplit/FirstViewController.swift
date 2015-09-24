//
//  FirstViewController.swift
//  MoneySplit
//
//  Created by Aiqi Liu on 9/21/15.
//  Copyright (c) 2015 Aiqi Liu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var itemCost: UITextField!
    @IBOutlet var people: UITextField!
    @IBOutlet var result: UILabel!

    @IBOutlet var item: UITextField!
    struct MyVariables {
        static var splited :Double = 0
    }
    
    @IBAction func action(sender: AnyObject) {
        var par: Double = (people.text as NSString).doubleValue
        var indiMon = (itemCost.text as NSString).doubleValue
        
        //keyboard goes away after clciking on button
        self.itemCost.resignFirstResponder()

        var mean = indiMon/par;
        
    }
//    override func viewWillAppear(animated: Bool) {
//        // Get a reference to the model data from the custom tab bar controller.
//        let model = (self.tabBarController as CustomTabBarController).model.splited =
//        
//        // Show the we can access and update the model data from the first tab.
//        // Let's just increase the age each time this tab appears and assign
//        // a random name.
//    }
    

    //click the blank area. keyboard goes away
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    

    
    
    
   
}

