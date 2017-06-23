//
//  ViewController.swift
//  PickerViewSample
//
//  Created by andyron on 16/8/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: NSDictionary!
    var pickerProvincesData: NSArray!
    var pickerCitiesData: NSArray!
    
    @IBAction func onclick(sender: AnyObject) {
        let row1 = self.pickerView.selectedRowInComponent(0)
        let row2 = self.pickerView.selectedRowInComponent(1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        
        let title = String(format: "%@, %@市", selected1, selected2)
        
        self.label.text = title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = NSBundle.mainBundle().pathForResource("provinces_cities", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dict
        
        self.pickerProvincesData = self.pickerData.allKeys
        
        let selectedProvince = self.pickerProvincesData[0] as! String
        self.pickerCitiesData = self.pickerData[selectedProvince] as! NSArray
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: --实现协议UIPickerViewDataSource方法
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return self.pickerProvincesData.count
        } else {
            return self.pickerCitiesData.count
        }
    }
    
    // MARK: --实现协议UIPickerViewDelegate方法
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return self.pickerProvincesData[row] as? String
        } else {
            return self.pickerCitiesData[row] as? String
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            let seletedProvince = self.pickerProvincesData[row] as! String
            self.pickerCitiesData = self.pickerData[seletedProvince] as! NSArray
            
            self.pickerView.reloadComponent(1)
        }
    }


}

