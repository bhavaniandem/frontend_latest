//
//  SplashViewController.swift
//  Test1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var myButton0: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton0.layer.cornerRadius = myButton0.frame.size.height/2
        myButton0.layer.masksToBounds = true
        
        myButton0.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)

        
    }
    

    

}
