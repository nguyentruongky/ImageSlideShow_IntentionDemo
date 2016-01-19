//
//  ImageSlideShowIntention.swift
//  ImageSlideShow_IntentionDemo
//
//  Created by Ky Nguyen on 1/14/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

class ImageSlideShowIntention: NSObject {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var indicatorPageControl: UIPageControl!
    
    func loadImagesToSlideShow(images:[String]) {
        
        for var i = 0; i < images.count; i++ {
            
            let imageSlide = formatSlide(images[i], slideIndex: i)
            scrollView.addSubview(imageSlide)
        }
        
        formatPageControl(images.count)
        formatScrollView(images.count)
    }
    
    private func formatSlide(imagesName: String, slideIndex: Int) -> UIImageView {
        
        let imageSource = UIImage(named: imagesName)
        let imageView = UIImageView(image: imageSource)
        imageView.contentMode = .ScaleAspectFit
        imageView.clipsToBounds = true
        
        // Set size and position for image slide.
        var frame = scrollView.frame
        frame.origin.x = CGFloat(slideIndex) * scrollView.frame.width
        imageView.frame = frame
        
        return imageView
    }

    private func formatPageControl(pageCount: Int) {
        
        indicatorPageControl.backgroundColor = UIColor.blackColor()
        indicatorPageControl.numberOfPages = pageCount
    }

    private func formatScrollView(pageCount: Int) {
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.width * CGFloat(pageCount), scrollView.frame.height)
    }
    
    // scroll event
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        indicatorPageControl.currentPage = page
    }
}
