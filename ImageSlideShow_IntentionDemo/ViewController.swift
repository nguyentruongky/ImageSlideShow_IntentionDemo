//
//  ViewController.swift
//  ImageSlideShow_IntentionDemo
//
//  Created by Ky Nguyen on 1/14/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slideShowIntention: ImageSlideShowIntention!
    
    let imageNames = [
        "son_doong_1",
        "son_doong_2"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slideShowIntention.loadImagesToSlideShow(imageNames)
    }

  


}

