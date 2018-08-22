//
//  CityDetailViewController.swift
//  Project 05 City
//
//  Created by Chris on 22/8/2018.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {

    var currentIndex = 0
    private lazy var city = FavoriteCities().cities[currentIndex]
    
    @IBOutlet weak var pageIndicator: UILabel!
    @IBOutlet weak var firstPageIndicator: UILabel!
    @IBOutlet weak var lastPageIndicatior: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextView: UILabel!
    @IBOutlet weak var detailTextView: UILabel!
    @IBAction func zoomImage(_ sender: Any) {
        performSegue(withIdentifier: "zoom", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: city.image)
        nameTextView.text = city.name
        detailTextView.text = city.info
        switch currentIndex {
        case 0:
            firstPageIndicator.isHidden = false
        case 11:
            lastPageIndicatior.isHidden = false
        default:
            pageIndicator.isHidden = false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "zoom",
            let zoomVC = segue.destination as? ZoomImageViewController{
            zoomVC.cityImage = imageView.image
        }
    }
}
