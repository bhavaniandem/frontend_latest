//
//  RegisterViewController.swift
//  Test1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Textfield1: UITextField!
    @IBOutlet weak var Textfield2: UITextField!
    @IBOutlet weak var Textfield4: UITextField!
    
    
    @IBOutlet weak var Textfield3: UITextField!
    @IBOutlet weak var myButton2: UIButton!
    @IBAction func savePassenger(_ sender: Any) {
        let name = self.Textfield1.text!
        let email = self.Textfield2.text!
        let password = self.Textfield3.text!
        let contact=self.Textfield4.text!
        var x:Bool=isValidEmail(emailStr: email)
        print(x)
        var y:Bool=isValidContact(contactStr: contact)
        print(y)
        var z:Bool=isPasswordValid(password: password)
        
        
        if name==""
        {
            let alertController = UIAlertController(title: "Alert", message:
                "Enter valid name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else if !x
        {
            let alertController = UIAlertController(title: "Alert", message:
                "Enter valid email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else if !y
        {
            let alertController = UIAlertController(title: "Alert", message:
                "Enter valid contact", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        } else if !z
        {
            let alertController = UIAlertController(title: "Alert", message:
                "Password should be min 8 characters long. Should contain atleast one lowercase,one upper case,one special character and a digit ", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else
        {
            // print("tripuytfvbnm")
            self.performSegue(withIdentifier: "regv", sender: nil)
        }
        
        
       
        AF.request("http://localhost:8080/regPage?name=\(name)&email=\(email)&password=\(password)&contact=\(contact)").validate()
        UserDefaults.standard.set(email, forKey: "email")
        
        self.Textfield1.text = ""
        self.Textfield2.text = ""
        self.Textfield3.text = ""
        self.Textfield4.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton2.layer.cornerRadius = myButton2.frame.size.height/2
        myButton2.layer.masksToBounds = true
        Textfield3.isSecureTextEntry=true
        myButton2.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)
        Textfield1.delegate = self
        
        Textfield2.delegate = self
        Textfield3.delegate = self
        Textfield4.delegate = self 
     

    }
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func isValidContact(contactStr:String) -> Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with:contactStr )
        return isValidPhone
    }
    
    func isPasswordValid(password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

    

}
