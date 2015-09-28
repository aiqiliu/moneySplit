//
//  SecondViewController.swift
//  MoneySplit
//
//  Created by Aiqi Liu on 9/21/15.
//  Copyright (c) 2015 Aiqi Liu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{


    @IBOutlet var navBar: UILabel!
   
    @IBOutlet var MoneySplit: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    
    var info = basicInfo()
    var display :String = ""
    var tableList :[String] = []
    var cnt = 0
    var j = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![0] as! FirstViewController
        self.info = svc.info
        
        //tableList = info.display
        display = ""
        
        for (var i = 0; i < info.splited.count; i++) {
            if (info.splited[i] != 0) {
                display = display + info.display[i]
                
                tableList.append(info.display[i])
                
            }
        }

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.reloadData()
        tableList = []
        for (var i = 0; i < info.splited.count; i++) {
            if (info.splited[i] != 0) {
                display = display + info.display[i]
                
                tableList.append(info.display[i])
                
            }
        }

        
        //tableList = info.display
        print(tableList)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableList = info.display
        tableList = []
        for (var i = 0; i < info.splited.count; i++) {
            if (info.splited[i] != 0) {
                display = display + info.display[i]
                
                tableList.append(info.display[i])
                
            }
        }
        return tableList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let textCellIdentifier = "TextCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        //tableList = info.display

        tableList = []
        for (var i = 0; i < info.splited.count; i++) {
            if (info.splited[i] != 0) {
                display = display + info.display[i]
                
                tableList.append(info.display[i])
                
            }
        }
        cell.textLabel!.text = tableList[row]
        print(tableList[row])
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

