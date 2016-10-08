//
//  ViewController.swift
//  PageNavigation
//
//  Created by andyron on 29/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

enum DirectionForward: Int {
    case Before = 1  // 向前
    case After = 2   // 向后
}

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // 当前页
    var pageIndex = 0
    // 翻页的方向
    var directionForward = DirectionForward.After
    
    var pageViewController: UIPageViewController!
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let page1ViewController = UIViewController()
        let page2ViewController = UIViewController()
        let page3ViewController = UIViewController()
        
        let imageView1 = UIImageView(frame: self.view.frame)
        imageView1.image = UIImage(named: "达芬奇-蒙娜丽莎")
        page1ViewController.view.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame: self.view.frame)
        imageView2.image = UIImage(named: "罗丹-思想者")
        page2ViewController.view.addSubview(imageView2)
        
        let imageView3 = UIImageView(frame: self.view.frame)
        imageView3.image = UIImage(named: "保罗克利-肖像")
        page3ViewController.view.addSubview(imageView3)
        
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        
        self.pageViewController.setViewControllers([page1ViewController], direction: .Forward, animated: true, completion: nil)
        
        self.view.addSubview(self.pageViewController.view)
        
        pageIndex = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewControlle(pageViewController: UIPageViewController, viewControllerVBeforeViewController viewController: UIViewController) -> UIViewController? {
        pageIndex -= 1
        
        if pageIndex < 0 {
            pageIndex = 0
            return nil
        }
        
        directionForward = .Before
        return self.viewControllers[pageIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        pageIndex += 1
        
        if pageIndex>2 {
            pageIndex = 2
            return nil;
        }
        
        directionForward = .After
        return self.viewControllers[pageIndex]
    }
    
    
    
    
    
    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        self.pageViewController.doubleSided = false
        return .Min
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed == false {
            if directionForward == .After {
                pageIndex -= 1
            }
            if directionForward == .Before {
                pageIndex += 1
                
            }
        }
        
        
        
    }
    


}

