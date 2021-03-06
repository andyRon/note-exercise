//
//  ViewController.swift
//  Camera
//
//  Created by andyron on 9/14/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var takePictureButton: UIButton!
    
    var avPlayerViewController: AVPlayerViewController?
    var image: UIImage?
    var movieURL: NSURL?
    var lastChosenMediaType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 判断是iOS设备是不有照相机， 没有照相机就隐藏拍摄按钮
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) {
            takePictureButton.hidden = true
        }
    }
    
    @IBAction func shootPictureOrVideo(sender: UIButton) {
        pickMediaFromSource(UIImagePickerControllerSourceType.Camera)
    }
    
    @IBAction func selectExistingPictureOrVideo(sender: UIButton) {
        pickMediaFromSource(UIImagePickerControllerSourceType.PhotoLibrary)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    func updateDisplay() {
        if let mediaType = lastChosenMediaType {
            if mediaType == kUTTypeImage as NSString {
                imageView.image = image!
                imageView.hidden = false
                if avPlayerViewController != nil {
                    avPlayerViewController!.view.hidden = true
                }
            } else if mediaType == kUTTypeMovie as NSString {
                if avPlayerViewController == nil {
                    avPlayerViewController = AVPlayerViewController()
                    let avPlayerView = avPlayerViewController!.view
                    avPlayerView.frame = imageView.frame
                    avPlayerView.clipsToBounds = true
                    view.addSubview(avPlayerView)
                    setAVPlayerViewLayoutConstraints()
                }
                
                if let url = movieURL {
                    imageView.hidden = true
                    avPlayerViewController!.player = AVPlayer(URL: url)
                    avPlayerViewController!.view.hidden = false
                    avPlayerViewController!.player!.play()
                }
            }
        }
    }
    
    func setAVPlayerViewLayoutConstraints() {
        let avPlayerView = avPlayerViewController!.view
        avPlayerView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["avPlayerView": avPlayerView,
                     "takePictureButton": takePictureButton]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[avPlayerView]|", options: .AlignAllLeft,
            metrics:nil, views:views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[avPlayerView]-0-[takePictureButton]",
            options: .AlignAllLeft, metrics:nil, views:views))
    }
    
    func pickMediaFromSource(sourceType:UIImagePickerControllerSourceType) {
        let mediaTypes =
            UIImagePickerController.availableMediaTypesForSourceType(sourceType)!
        if UIImagePickerController.isSourceTypeAvailable(sourceType)
            && mediaTypes.count > 0 {
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            presentViewController(picker, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title:"Error accessing media",
                                                    message: "Unsupported media source.",
                                                    preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    //##MARK -- UIImagePickerControllerDelegate
    // 当用户成功拍摄照片、视频，或者在媒体库选择后调用
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? String
        if let mediaType = lastChosenMediaType {
            if mediaType == kUTTypeImage as NSString {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            } else if mediaType == kUTTypeMovie as NSString {
                movieURL = info[UIImagePickerControllerEditedImage] as? NSURL
            }
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    // 取消选择时调用
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion:nil)
    }


}

