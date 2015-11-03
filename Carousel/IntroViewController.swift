//
//  IntroViewController.swift
//  Carousel
//
//  Created by Arreguin, Juan on 11/3/15.
//  Copyright © 2015 Arreguin, Juan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scroll Size
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        
        // Scroll Tiles
        scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // On Scroll animate photos.
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        tile1.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
        print("scroll")
    }
    
    
    @IBAction func onPressButton(sender: AnyObject) {
        print("pressed")
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
