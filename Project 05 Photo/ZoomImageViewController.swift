//
//  ZoomImageViewController.swift
//  Project 05 City
//
//  Created by Chris on 22/8/2018.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit

class ZoomImageViewController: UIViewController, UIScrollViewDelegate {

    var imageView = UIImageView()
    var cityImage: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.addSubview(imageView)
            scrollView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityImage != nil{
            scrollView.contentSize = imageView.frame.size
            scrollView.minimumZoomScale = min(view.frame.height/cityImage!.size.height, view.frame.width/cityImage!.size.width)
            scrollView.maximumZoomScale = scrollView.minimumZoomScale * 2
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if cityImage != nil{
            scrollView.minimumZoomScale = min(view.frame.height/cityImage!.size.height, view.frame.width/cityImage!.size.width)
            scrollView.maximumZoomScale = scrollView.minimumZoomScale * 2
            if scrollView.zoomScale < scrollView.minimumZoomScale{
                scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false)
            } else if scrollView.zoomScale > scrollView.maximumZoomScale{
                scrollView.setZoomScale(scrollView.maximumZoomScale, animated: false)
            } else {
                imageView.center = CGPoint(x: max((scrollView.contentSize.width/2), (scrollView.frame.width/2)), y: max((scrollView.contentSize.height/2), (scrollView.frame.height*0.45)))
            }
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        imageView.center = CGPoint(x: max((scrollView.contentSize.width/2), (scrollView.frame.width/2)), y: max((scrollView.contentSize.height/2), (scrollView.frame.height*0.45)))
        
    }

}
