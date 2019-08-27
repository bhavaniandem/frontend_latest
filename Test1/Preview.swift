//
//  ThirdViewController.swift
//  Project1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.s
//

import UIKit

class Preview: UIViewController {
    
    
 
    @IBOutlet weak var serviceNo: UILabel!
    
    @IBOutlet weak var startTime: UILabel!
    // @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var to: UILabel!
    
    @IBOutlet weak var from: UILabel!
    //@IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var seatNumber: UILabel!
    
    @IBOutlet weak var dateOfJourney: UILabel!

    var myFrom:String?
    var myTo:String?
    var myDateOfJourney:String?
    var myServiceNo:String?
    var mySeatNo:String?
    var myPrice:Int!
    var myDuration:Int!
    var myStartTime:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(myFrom!)
        
        
        serviceNo.text=myServiceNo
        from.text=myFrom
        to.text=myTo
        
        dateOfJourney.text=myDateOfJourney
        seatNumber.text=mySeatNo
        cost.text = "Rs." + String(myPrice)
        
        startTime.text=myStartTime
        duration.text = String(myDuration)
        
        // Do any additional setup after loading the view.
    }
    
    
    
  
    
}
