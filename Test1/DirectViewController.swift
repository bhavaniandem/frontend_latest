//
//  DirectViewController.swift
//  Test1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class DirectViewController: UIViewController {

    @IBOutlet weak var myButton3: UIButton!
    
    @IBOutlet weak var myButton4: UIButton!
    
    @IBOutlet weak var myButton5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton3.layer.cornerRadius = myButton3.frame.size.height/2
        myButton3.layer.masksToBounds = true
        
        myButton3.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)
        
        
        myButton4.layer.cornerRadius = myButton4.frame.size.height/2
        myButton4.layer.masksToBounds = true
        
        myButton4.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)
        
        myButton5.layer.cornerRadius = myButton5.frame.size.height/2
        myButton5.layer.masksToBounds = true
        
        myButton5.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)

    }

}
