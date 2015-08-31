//
//  PageViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/31.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageSubHeadings = [
        "Pin your favourite restaurants and create your own food guide",
        "Search and locate your favourite restaurant on Maps",
        "Find restaurants pinned by your friends and other foodies around the world"
    ]
    var pageImages = ["homei", "mapintro", "fiveleaves"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        if let startingViewController = self.viewControllerAtIndex(0) {
            setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Page view controller data source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).index
        index++
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).index
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> PageContentViewController? {
        if index == NSNotFound || index < 0 || index >= self.pageHeadings.count {
            return nil
        }
        
        if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func forward(index: Int) {
        if let nextViewController = self.viewControllerAtIndex(index + 1) {
            setViewControllers([nextViewController], direction: .Forward, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
