//
//  ViewController.swift
//  MVCTrailzDemo
//
//  Created by Adam Gerhartz on 6/3/20.
//  Copyright © 2020 Adam Gerhartz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var contentWidth: CGFloat = 0.0
    var sectionHeaderLbl: UILabel = UILabel()
    var trailNames: Array = ["Mountain Trail", "Riverfront Trail", "Red Rock Trail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // for loop
        for image in 0...2 {
            let trailNameLbl: UILabel = UILabel()
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            trailNameLbl.text = trailNames[image]
            
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 200, y: (view.frame.height / 2) - 200, width: 400, height: 230)
            trailNameLbl.frame = CGRect(x: xCoordinate - 200, y: (view.frame.height / 2), width: 250, height: 100)
           
            trailNameLbl.textColor = UIColor.init(red: 195.0/255.0, green: 176.0/255.0, blue: 145.0/255.0, alpha: 1)
            trailNameLbl.font = UIFont(name: "Courier New", size: 25)
            scrollView.addSubview(trailNameLbl)
            
            //now you need a tap gesture recognizer
            //note that target and action point to what happens when the action is recognized.
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
            //Add the recognizer to your view.
        }
        
        sectionHeaderLbl.frame = CGRect(x: 8, y: (view.frame.height / 7), width: 300, height: 100)
        sectionHeaderLbl.text = "Suggested Trails"
        sectionHeaderLbl.textColor = UIColor.init(red: 45.0/255.0, green: 119.0/255.0, blue: 255.0/255.0, alpha: 1)
        sectionHeaderLbl.font = UIFont(name: "Avenir Next", size: 36)
        self.view.addSubview(sectionHeaderLbl)
        
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Image Tapped successfully")
        let newView = self.storyboard?.instantiateViewController(withIdentifier: "trailD") as! TrailDescriptionViewController
        self.navigationController?.pushViewController(newView, animated: true)
    }

}

