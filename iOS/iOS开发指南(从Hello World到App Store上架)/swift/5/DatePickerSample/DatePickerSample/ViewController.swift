//
//  ViewController.swift
//  DatePickerSample
//
//  Created by andyron on 16/8/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datapicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onclick(sender: AnyObject) {
        var theDate: NSDate = self.datapicker.date
        let desc = theDate.descriptionWithLocale(NSLocale.currentLocale())
        NSLog("the date picked is: %@", desc)
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        NSLog("the date formatter is: %@", dateFormatter.stringFromDate(theDate))
        
        self.label.text = dateFormatter.stringFromDate(theDate)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

