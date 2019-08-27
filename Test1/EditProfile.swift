//
//  ViewController.swift
//  userprofile
//
//  Created by Apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EditProfile: UIViewController {
    
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var unamelabel: UITextField!
    
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var contacttext: UITextField!
    var arrRes = [[String : AnyObject]]()
    
    var emailId=UserDefaults.standard.object(forKey: "email")!
   
    
    
//    @IBAction func updatpwd(_ sender: Any) {
//
//        performSegue(withIdentifier: "mysegue", sender: self)
//    }
//
//
//    @IBAction func updatecntct(_ sender: Any) {
//        performSegue(withIdentifier: "mysegue2", sender: self)
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let username = self.unamelabel.text!
        let password = self.passwordtext.text!
        let email = self.emailtext.text!
        let contactnumber = self.contacttext.text!
        print(emailId)
        
        
        AF.request("http://localhost:8080/viewprofile?email=\(emailId)").responseJSON{(responseData) -> Void in
            
            
            print(JSON(responseData.data))
            let res=JSON(responseData.data)
            
            print(res["list"][0])
            //let z = res["list"][0]["username"]
            self.unamelabel.text = res["list"][0]["name"].string!
            self.passwordtext.text = res["list"][0]["password"].string!
            self.emailtext.text = res["list"][0]["email"].string!
            self.contacttext.text = res["list"][0]["contact"].string!
            
            
        
    }
    
    
    }
    
}
