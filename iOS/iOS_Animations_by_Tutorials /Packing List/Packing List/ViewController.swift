//
//  ViewController.swift
//  Packing List
//
//  Created by Andy Ron on 2018/10/13.
//  Copyright © 2018 Andy Ron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonMenu: UIButton!
    
    var slider: HorizontalItemList!
    var isMenuOpen = false
    var items: [Int] = [5, 6, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.rowHeight = 54.0
    }
    
    func showItem(_ index: Int) {
        print("tapped item \(index)")
    }


}

let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(items[indexPath.row])
    }
}

