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
        
        let offset = Float(scrollView.contentOffset.y)
        let tx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        let ty = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        
        let scale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile1.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tile2.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile2.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile2.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tile3.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile3.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile3.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tile4.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile4.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile4.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tile5.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile5.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile5.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tile6.transform = CGAffineTransformMakeTranslation(tx, ty)
        tile6.transform = CGAffineTransformScale(tile1.transform, scale, scale)
        tile6.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        
        
        print("content offset: \(scrollView.contentOffset.y)")
        
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
