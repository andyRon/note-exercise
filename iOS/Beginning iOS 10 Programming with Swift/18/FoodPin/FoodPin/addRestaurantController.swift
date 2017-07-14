//
//  addRestaurantController.swift
//  FoodPin
//
//  Created by andyron on 2017/3/8.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class addRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var photoaImageView: UIImageView!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    var isVisited = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "New Restaurant"
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //isSourceTypeAvailable方法用来判断用户是否允许访问相册
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
//                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
    }
    // 当图片在相册被选择时调用
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoaImageView.image = selectedImage
            photoaImageView.contentMode = .scaleAspectFill
            photoaImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoaImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: photoaImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoaImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: photoaImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoaImageView, attribute: .top, relatedBy: .equal, toItem: photoaImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let buttomConstraint = NSLayoutConstraint(item: photoaImageView, attribute: .bottom, relatedBy: .equal, toItem: photoaImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        buttomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleBeenHereButton(sender: UIButton) {
        if sender == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor = UIColor.gray
        } else if sender == noButton {
            isVisited = false
            yesButton.backgroundColor = UIColor.gray
            noButton.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func save(sender: AnyObject) {
        if nameTextField.text! == "" || typeTextField.text! == "" || locationTextField.text! == "" {
            let alertController = UIAlertController(title: "信息不全", message: "name,type,location都需要", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
        dismiss(animated: true, completion: nil)
    }

}
