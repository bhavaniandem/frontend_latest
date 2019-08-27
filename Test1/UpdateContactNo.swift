//
//  thirdViewController.swift
//  userprofile
//
//  Created by Apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire

class UpdateContactNo: UIViewController {
    
    
    @IBOutlet weak var contactno: UITextField!
    
    //let emailId:String="satyav@gmail.com"
    var emailId=UserDefaults.standard.object(forKey: "email")!
    @IBOutlet weak var UpdateContact: UIButton!
    @IBAction func UpdateContactNumber(_ sender: Any) {
        let contact=self.contactno.text!;
        print("tripura")
        AF.request("http://localhost:8080/updateContact?contact=\(contact)&email=\(emailId)").validate()
        
        print("hello priya...contact updated")
        contactno.text=""
        performSegue(withIdentifier: "returnUpdate", sender: self)
        
        
    }
    
   
    
    @IBAction func returnUpdate(_ sender: Any) {
        
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
