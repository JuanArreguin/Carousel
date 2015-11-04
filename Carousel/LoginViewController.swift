//
//  LoginViewController.swift
//  Carousel
//
//  Created by Arreguin, Juan on 11/3/15.
//  Copyright © 2015 Arreguin, Juan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        // Keyboard Push
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Keyboard Slide up/down
    
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, 0)
        let maxContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        scrollView.contentOffset.y = maxContentOffsetY
        scrollView.scrollEnabled = true
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.transform = CGAffineTransformIdentity
        scrollView.contentOffset.y = 0
        scrollView.scrollEnabled = false
    }
    
    // End Editing / Keyboard
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // Sign In Button
    @IBAction func didPressLogin(sender: AnyObject) {
        self.validateCredentials()
    }

    func validateCredentials() {
        if emailField.text == "juan@arregu.in" && passwordField.text == "password" {
            loginIndicator.startAnimating()
            
            delay(2, closure: { () -> () in
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
            })
        }
        else if emailField.text == "" || passwordField.text == "" {
            
            let emptyAlert = UIAlertController(title: "Missing something?", message: "Try that one again.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            })
            
            emptyAlert.addAction(okAction)
            
            presentViewController(emptyAlert, animated: true, completion: nil)
        }
        else {
            loginIndicator.startAnimating()
            delay(2, closure: { () -> () in
                
                let alert = UIAlertController(title: "Heads up!", message: "Let's try that again.", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                    self.loginIndicator.stopAnimating()
                })
                
                alert.addAction(okAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
            })
            
        }
    }

    
    
    
    
    
    //
    // Transition Back to previous view.
    //
    
    
    @IBAction func didTapBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
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