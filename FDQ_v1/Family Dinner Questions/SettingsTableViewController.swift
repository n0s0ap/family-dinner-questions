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
    @IBOutlet weak var packOneSwitch: UISwitch!
    @IBOutlet weak var packTwoSwitch: UISwitch!
    @IBOutlet weak var packThreeSwitch: UISwitch!
    @IBOutlet weak var notifyMeTime: UIDatePicker!
    @IBOutlet weak var detailLabel: UILabel!
    
    let defaults = UserDefaults.standard
    

    @IBAction func packOneSwitchState(_ sender: UISwitch) {
        
        if sender.isOn {
            
            defaults.set(true, forKey: "purchasedPackOne")
            heyInquisitor()
            print("Mix in pack ONE")
            
        }else {
            
           defaults.set(false, forKey: "purchasedPackOne")
            heyInquisitor()
            print("Take out ONE")
        }
    }
    
    @IBAction func packTwoSwitchState(_ sender: UISwitch) {
        
        if sender.isOn {
            
            defaults.set(true, forKey: "purchasedPackTwo")
            heyInquisitor()
            print("Mix in pack TWO")
        }else {
            
            defaults.set(false, forKey: "purchasedPackTwo")
            heyInquisitor()
            print("Take out TWO")
        }
    }
    
    @IBAction func packThreeSwitchState(_ sender: UISwitch) {
        
        if sender.isOn {
            
            defaults.set(true, forKey: "purchasedPackThree")
            heyInquisitor()
            print("Mix in pack THREE")
        }else {
            
            defaults.set(false, forKey: "purchasedPackThree")
            heyInquisitor()
            print("Take out THREE")
        }
    }
    

    
    func updateDeck(_ notification: Notification) {
        print("booyakasha")
    }
    //    End Pack Management
    
    
    var datePickerHidden = true
    let theTimeFromSettings:Date! = UserDefaults.standard.value(forKey: "notifyMeTime") as? Date!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setPackOneMixSetting()
        self.setPackTwoMixSetting()
        self.setPackThreeMixSetting()
        
        datePickerChanged()
        
        detailLabel.text = DateFormatter.localizedString(from: theTimeFromSettings, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
        if (defaults.object(forKey: "SwitchState") != nil) {
            notifyMeSwitch.isOn = defaults.bool(forKey: "SwitchState")
        }
        
        notifyMeTime.datePickerMode = UIDatePickerMode.time // 4- use time only
        let currentDate = Date()  //5 -  get the current date
        //notifyMeTime.minimumDate = currentDate  //6- set the current date/time as a minimum
       
        print("I just got the time from settings and it is: \(theTimeFromSettings)")
        
        
        if ((defaults.value(forKey: "notifyMeTime")) != nil){
            notifyMeTime.date = theTimeFromSettings
        } else {
            defaults.setValue(notifyMeTime.date, forKey: "notifyMeTime")
        }
        
        let packOneMixSetting = defaults.bool(forKey: "purchasedPackOne")
        
       print("yeah boi\(packOneMixSetting)")
        print("the time from the picker is \(currentDate)")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    
    fileprivate func setPackOneMixSetting() {
        let packOneMixSetting = defaults.bool(forKey: "purchasedPackOne")
        if packOneMixSetting {
            self.packOneSwitch.setOn(true, animated:true)
        } else {
            self.packOneSwitch.setOn(false, animated:false)
        }
    }
    
    fileprivate func setPackTwoMixSetting() {
        let packTwoMixSetting = defaults.bool(forKey: "purchasedPackTwo")
        if packTwoMixSetting {
            self.packTwoSwitch.setOn(true, animated:true)
        } else {
            self.packTwoSwitch.setOn(false, animated:false)
        }
    }
    
    fileprivate func setPackThreeMixSetting() {
        let packThreeMixSetting = defaults.bool(forKey: "purchasedPackThree")
        if packThreeMixSetting {
            self.packThreeSwitch.setOn(true, animated:true)
        } else {
            self.packThreeSwitch.setOn(false, animated:false)
        }
    }
    
    func datePickerChanged () {
        detailLabel.text = DateFormatter.localizedString(from: notifyMeTime.date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath as NSIndexPath).section == 0 && (indexPath as NSIndexPath).row == 1 {
            toggleDatepicker()
        }
    }
    
    
    func toggleDatepicker() {
        
        datePickerHidden = !datePickerHidden
        
        defaults.setValue(notifyMeTime.date, forKey: "notifyMeTime")
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if datePickerHidden && (indexPath as NSIndexPath).section == 0 && (indexPath as NSIndexPath).row == 2 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }

    @IBAction func notifyMeTimeSet(_ sender: UIDatePicker) {
        defaults.setValue(notifyMeTime.date, forKey: "notifyMeTime")
        let timechanged = DateFormatter.localizedString(from: notifyMeTime.date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
        print("changed the time to \(timechanged)")
        datePickerChanged()
        UIApplication.shared.cancelAllLocalNotifications()
        notifyAtDinnerTime()
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
