//
//  ShareViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/27.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var twitterView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        facebookView.hidden = true
        twitterView.hidden = true
        messageView.hidden = true
        emailView.hidden = true
        
        facebookView.transform = CGAffineTransformMakeTranslation(0, -500)
        twitterView.transform = CGAffineTransformMakeTranslation(0, -300)
        messageView.transform = CGAffineTransformMakeTranslation(0, 500)
        emailView.transform = CGAffineTransformMakeTranslation(0, 300)
    }
    
    override func viewDidAppear(animated: Bool) {
        facebookView.hidden = false
        twitterView.hidden = false
        messageView.hidden = false
        emailView.hidden = false
        
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: nil, animations: {
            self.facebookView.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        UIView.animateWithDuration(1.5, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: nil, animations: {
            self.twitterView.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        UIView.animateWithDuration(1.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: nil, animations: {
            self.messageView.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: nil, animations: {
            self.emailView.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
