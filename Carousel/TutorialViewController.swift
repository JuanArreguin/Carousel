//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Arreguin, Juan on 11/3/15.
//  Copyright © 2015 Arreguin, Juan. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeForSpinButton: UIImageView!
    @IBOutlet weak var backUpSwitch: UISwitch!
    @IBOutlet weak var tryNowButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        takeForSpinButton.hidden = true
        takeForSpinButton.alpha = 0
        backUpSwitch.hidden = true
        
        // Scroll Size
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        pageControl.numberOfPages = 4
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pageControlDidPage(sender: AnyObject) {
        let xOffset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPointMake(xOffset,0) , animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if pageControl.currentPage == 3 {
            pageControl.hidden = true
            takeForSpinButton.hidden = false
            takeForSpinButton.alpha = 1
            backUpSwitch.hidden = false
        }
        else {
            pageControl.hidden = false
            takeForSpinButton.alpha = 0
            backUpSwitch.hidden = true
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
