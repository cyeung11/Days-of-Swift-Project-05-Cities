//
//  PageViewController.swift
//  Project 05 City
//
//  Created by Chris on 22/8/2018.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var currentIndex = 0
    
    private var cityDetailVC: CityDetailViewController?{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityDetailViewController") as? CityDetailViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let cityDetailVC = cityDetailVC{
            cityDetailVC.currentIndex = currentIndex
            setViewControllers([cityDetailVC], direction: .forward, animated: false, completion: nil)
        }
    
    }
    
    // MARK: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentIndex > 0,
            let cityDetailVC = cityDetailVC,
            let currentVC = viewController as? CityDetailViewController{
            cityDetailVC.currentIndex = currentVC.currentIndex - 1
            return cityDetailVC
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentIndex < 11,
            let cityDetailVC = cityDetailVC,
            let currentVC = viewController as? CityDetailViewController{
            cityDetailVC.currentIndex = currentVC.currentIndex + 1
            return cityDetailVC
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let detailVC = pendingViewControllers[0] as? CityDetailViewController{
            currentIndex = detailVC.currentIndex
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
