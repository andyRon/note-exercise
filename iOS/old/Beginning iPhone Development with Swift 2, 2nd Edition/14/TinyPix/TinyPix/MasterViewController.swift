//
//  MasterViewController.swift
//  TinyPix
//
//  Created by andyron on 9/20/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet var colorControl: UISegmentedControl!
    private var documentFileURLs: [NSURL] = []
    private var chosenDocument: TinyPixDocument?
    
    private func urlForFileName(fileName: String) -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!.URLByAppendingPathComponent(fileName)!
    }
    
    private func reloadFiles() {
        let fm = NSFileManager.defaultManager()
        let documentsURL = fm.URLsForDirectory(
            .DocumentDirectory, inDomains: .UserDomainMask).first!
        do {
            let fileURLs = try fm.contentsOfDirectoryAtURL(documentsURL,
                                                           includingPropertiesForKeys: nil, options: [])
            let sortedFileURLs = fileURLs.sort() { file1URL, file2URL in
                let attr1 = try! fm.attributesOfItemAtPath(file1URL.path!)
                let attr2 = try! fm.attributesOfItemAtPath(file2URL.path!)
                let file1Date = attr1[NSFileCreationDate] as! NSDate
                let file2Date = attr2[NSFileCreationDate] as! NSDate
                let result = file1Date.compare(file2Date)
                return result == NSComparisonResult.OrderedAscending
            }
            documentFileURLs = sortedFileURLs
            tableView.reloadData()
        } catch {
            print("Error listing files in directory \(documentsURL.path!): \(error)")
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileURLs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FileCell")!
        let fileURL = documentFileURLs[indexPath.row]
        cell.textLabel!.text = fileURL.URLByDeletingPathExtension!.lastPathComponent
        return cell
    }
    
    @IBAction func chooseColor(sender: UISegmentedControl) {
        let selectedColorIndex = sender.selectedSegmentIndex
        setTintColorForIndex(selectedColorIndex)
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setInteger(selectedColorIndex, forKey: "selectedColorIndex")
        prefs.synchronize()
    }
    
    private func setTintColorForIndex(colorIndex: Int) {
        colorControl.tintColor = TinyPixUtils.getTintColorForIndex(colorIndex)
    }
    
}

