//
//  TableViewController.swift
//  Pull Refresh
//
//  Created by bruno da luz on 4/30/15.
//  Copyright (c) 2015 bruno da luz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let gotham = ["batman","james gordan","harvey bullock"]
    let others = ["green lantern","spider man","chapolin"]
    
    var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableData = gotham
        
        self.refreshControl?.addTarget(self, action: "didRefreshList:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.refreshControl?.backgroundColor = UIColor.grayColor()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "last updated on \(NSDate())")
    }
    
    func didRefreshList(sender:AnyObject) {
        tableData = gotham + others
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]

        return cell
    }
}
