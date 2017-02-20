//
//  ViewFirstController.swift
//  PageView
//
//  Created by Josef Antoni on 20.02.17.
//  Copyright © 2017 Josef Antoni. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var name:String?
    
    override func viewDidAppear(_ animated: Bool) {
        print(name!)
    }
    
}

