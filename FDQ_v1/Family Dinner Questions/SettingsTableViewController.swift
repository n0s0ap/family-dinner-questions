//
//  SettingsTableViewController.swift
//  Family Dinner Questions
//
//  Created by Ben Lew on 5/1/15.
//  Copyright (c) 2015 Ben Lew. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var notifyMeSwitch: UISwitch!
    @IBOutlet weak var notifyMeTime: UIDatePicker!
    @IBAction func notifyMeSwitchSaveState(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if notifyMeSwitch.on {
            defaults.setBool(true, forKey: "notifyMeSwitchState")
            println("the switch says yes")
            notifyMeTime.userInteractionEnabled = true
            notifyMeTime.hidden = false
        } else {
            defaults.setBool(false, forKey: "notifyMeSwitchState")
            println("the switch says no")
            notifyMeTime.userInteractionEnabled = false
            notifyMeTime.hidden = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("SwitchState") != nil) {
            notifyMeSwitch.on = defaults.boolForKey("SwitchState")
            
        }
        
        notifyMeTime.datePickerMode = UIDatePickerMode.Time // 4- use time only
        let currentDate = NSDate()  //5 -  get the current date
        // notifyMeTime.minimumDate = currentDate  //6- set the current date/time as a minimum
        
        let theTimeFromSettings:NSDate = (NSUserDefaults.standardUserDefaults().valueForKey("notifyMeTime") as? NSDate)!
        println("I just got the time from settings and it is: \(theTimeFromSettings)")
        if ((defaults.valueForKey("notifyMeTime")) != nil){
            notifyMeTime.date = theTimeFromSettings
        } else {
            defaults.setValue(notifyMeTime, forKey: "notifyMeAtThisTime")
        }
        
        
        
        
        
        println("the time from the picker is \(currentDate)")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notifyMeTimeSet(sender: UIDatePicker) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(notifyMeTime.date, forKey: "notifyMeTime")
        let timechanged = notifyMeTime.date
        println("changed the time to \(timechanged) ")
    }
    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 2
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 3
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
