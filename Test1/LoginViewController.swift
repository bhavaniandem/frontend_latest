//
//  LoginViewController.swift
//  Test1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var myButton1: UIButton!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
     
    var arrRes = [[String : AnyObject]]()
    @IBAction func ValidateUser(_ sender: Any) {
        let email = self.email.text!
        let password = self.password.text!
        
        AF.request("http://localhost:8080/loginv?email=\(email)&password=\(password)").responseJSON { (responseData) -> Void in
            
            if let swiftJsonVar = (responseData.data)
            {
                //print(JSON(swiftJsonVar))
                let resData=JSON(swiftJsonVar)
                // self.arrRes = resData as! [[String:AnyObject]]
                // self.arrRes = resData as! [[String:AnyObject]]
                //  var dict = self.arrRes[1]
                //  var msg=arrRes["msg"] as? String
                // print(msg)
                //var msg=self.arrRes["msg"] as? String
                let msg=resData["msg"].string!
                print(msg)
                
                if(msg=="fail")
                {
                    let alertController = UIAlertController(title: "Alert", message:
                        "Invalid Credentials", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    //self.present(alertController,animated: true,completion: nil)
                }
                else{
                    UserDefaults.standard.set(email, forKey: "email")
                   // print(ema)
                    self.performSegue(withIdentifier: "loginv", sender: nil)
                    
                }
            }
            
    }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton1.layer.cornerRadius = myButton1.frame.size.height/2
        myButton1.layer.masksToBounds = true
        
        myButton1.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)
        password.isSecureTextEntry=true

        
    }

}
