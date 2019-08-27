//
//  EditProfileViewController.swift
//  Test1
//
//  Created by apple on 18/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.layer.cornerRadius = myButton.frame.size.height/2
        myButton.layer.masksToBounds = true
        
        myButton.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)

        
    }
    

    

}
