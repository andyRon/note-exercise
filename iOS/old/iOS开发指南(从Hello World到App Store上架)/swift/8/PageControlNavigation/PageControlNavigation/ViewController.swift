//
//  ViewController.swift
//  PageControlNavigation
//
//  Created by andyron on 25/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.scrollView.frame.size.height)
        self.scrollView.frame = self.view.frame
        
        self.imageView1 = UIImageView(frame: CGRectMake(0, 0, 320, 480))
        self.imageView1.image = UIImage(named: "达芬奇-蒙娜丽莎")
        self.scrollView.addSubview(self.imageView1)
        
        self.imageView2 = UIImageView(frame: CGRectMake(320, 0, 320, 480))
        self.imageView2.image = UIImage(named: "罗丹-思想者")
        self.scrollView.addSubview(self.imageView2)
        
        self.imageView3 = UIImageView(frame: CGRectMake(320*2, 0, 320, 480))
        self.imageView3.image = UIImage(named: "保罗克利-肖像")
        self.scrollView.addSubview(self.imageView3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -- 
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x)/320
    }
    
    @IBAction func changePage(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            let whichPage = self.pageControl.currentPage
            self.scrollView.contentOffset = CGPointMake(320*CGFloat(whichPage), 0)
        })
    }


}

