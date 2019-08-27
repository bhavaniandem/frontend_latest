//
//  secondViewController.swift
//  userprofile
//
//  Created by Apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire

class UpdatePassword: UIViewController {
    
    // @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var updatepassword: UITextField!
    //var email:String="satyav@gmail.com"
    var emailId=UserDefaults.standard.object(forKey: "email")!
    @IBAction func UpdatePswd(_ sender: Any) {
        let password=self.updatepassword.text!; AF.request("http://localhost:8080/updatepassword?password=\(password)&email=\(emailId)").validate()
        
        print("hello priya...password updated")
        updatepassword.text=""
        performSegue(withIdentifier: "returnPwd", sender: self)
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
