//
//  SecondViewController.swift
//  Project1
//
//  Created by apple on 18/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusList: UIViewController, UITextFieldDelegate , UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var FromTo: UILabel!
    var fromPlace:String=""
    var to:String=""
    var dateOfJournery:String=""
    //var servcNo:String=""
    var servcNo:String=""
    var price:Int=0
    var startTime:String=""
    var duration:Int=0
    
    var filter:String=""
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath)
        
        
        var dict = arrRes[indexPath.row]
        
        FromTo.text = "\(dict["fromPlace"]!) to \(dict["toPlace"]!)"
        print(FromTo.text!)
        
        cell1.textLabel?.text = "\(dict["serviceno"]!) \(dict["startTime"]!) \(dict["duration"]!) \(dict["price"]!)"
        return cell1
    }
    
    
    //@IBOutlet weak var btn: UIButton!
    //@IBOutlet weak var bookbtn: UIButton!
    // @IBOutlet weak var tableLabel: UILabel!
    // @IBOutlet weak var myLabel: UILabel!
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.arrRes.count)
        //print(from!)
        return self.arrRes.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title=nil
        if segue.identifier=="buslisttoseatsel"{
            print("layajkjk")
            print(self.price)
            let s=segue.destination as! SeatSelectionViewController
            
            s.myFrom=self.fromPlace
            s.myTo=self.to
            s.myDateOfJourney=self.dateOfJournery
            s.myServiceNo=self.servcNo
            s.myPrice=self.price
            
            print(s.myPrice!)
            s.myStartTime = self.startTime
            s.myDuration = self.duration
            
        }
            
    
        else {
            let t=segue.destination as! sleeperViewController
            t.myFrom=self.fromPlace
            t.myTo=self.to
            t.myDateOfJourney=self.dateOfJournery
            t.myServiceNo=self.servcNo
            t.myPrice=self.price
            
            print(t.myPrice!)
            t.myStartTime = self.startTime
            t.myDuration = self.duration

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //s.test="test"
        
        var dict = arrRes[indexPath.row]
        servcNo=dict["serviceno"]! as! String
        print(servcNo)
        price = dict["price"]! as! Int
        print(price)
        startTime = dict["startTime"] as! String
        duration = dict["duration"] as! Int

        
        
        

        if(filter=="Seater"){
        self.performSegue(withIdentifier:"buslisttoseatsel", sender: self)
        }else {
            self.performSegue(withIdentifier:"buslisttosleepsel", sender: self)

        }
        // navigationController?.pushViewController(NewController(), animated: true)
        
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var arrRes = [[String : AnyObject]]()
    
    //var e=(String).self.from!
    //print(type(of:from))
    //  let findAllString = "http://localhost:9002/employees?name=\(self.e)"
    //Array of dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        let findAllString = "http://localhost:8080/BusDetails?dateOfJourney=\(dateOfJournery)&from=\(fromPlace)&to=\(to)"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "jsonCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view.
        // firstName.delegate = self
        //firstName.becomeFirstResponder()
        //lastName.delegate = self
        //number.delegate = self
        loadData(urlToFetch : findAllString)
        
        self.tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     self.navigationItem.title=nil
     if segue.identifier=="mySegue2"{
     print("heelo")
     let s=segue.destination as! ThirdViewController
     // s.fromPlace=self.from
     //print("from in second \(s.from)")
     s.test="test"
     //s.dateOfJournery=self.dateOfJourney
     
     }
     }*/
    
    func loadData(urlToFetch : String){
        print(urlToFetch)
        
        AF.request(urlToFetch).responseJSON { (responseData) -> Void in
            print(responseData)
            // print(type(of: self.from))
            let swiftJsonVar = JSON(responseData.data as Any)
            print(swiftJsonVar)
            if let resData = swiftJsonVar["list"].arrayObject{
                self.arrRes = resData as! [[String:AnyObject]]
            }
            
            if(self.arrRes.count>0){
                print("my data number is\(self.arrRes.count)")
                self.tableView.reloadData()
            }
            
        }
        
        //print(arrRes)
        
        self.tableView.reloadData()
        
    }
    
    
    
}
