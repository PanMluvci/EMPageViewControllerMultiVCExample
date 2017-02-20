//
//  ContainerVC.swift
//  PageView
//
//  Created by Josef Antoni on 20.02.17.
//  Copyright © 2017 Josef Antoni. All rights reserved.
//

import EMPageViewController

class ContainerVC: UIViewController {
    
    var pageViewController: EMPageViewController?
    var previousIndex = -1
    var selectedIndex = 0
    
    override func viewDidLoad() {
        let pageViewController = EMPageViewController()
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        pageViewController.selectViewController(createFirstVC(), direction: .forward, animated: false, completion: nil)
        
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, at: 0) // Insert the page controller view below the navigation buttons
        pageViewController.didMove(toParentViewController: self)
        
        self.pageViewController = pageViewController
    }
    
    func createFirstVC() -> FirstViewController {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        viewController.name = "first"
        return viewController
    }
    
    func createSecondVC() -> SecondViewController {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //if you wanna pass a value
        viewController.name = "second"
        return viewController
    }
}

extension ContainerVC: EMPageViewControllerDataSource, EMPageViewControllerDelegate {
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if selectedIndex == 0 && previousIndex != 1{
            previousIndex = selectedIndex
            selectedIndex = selectedIndex + 1
            return nil
        } else {
            return nil
        }
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if selectedIndex == 1 {
            previousIndex = selectedIndex
            selectedIndex = selectedIndex - 1
            return createSecondVC()
        } else {
            return nil
        }
    }
}
