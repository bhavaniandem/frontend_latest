//
//  MyBookings.swift
//  Test1
//
//  Created by Apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyBookings: UITableViewController {
    
    
    @IBOutlet var Tableview: UITableView!
    var arrRes = [[String : AnyObject]]()
    var emailId=UserDefaults.standard.object(forKey: "email")!
           
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "jsonCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        print(emailId)
        let findAllString = "http://localhost:8080/previousbookings?email=\(emailId)"
        loadData(urlToFetch : findAllString)
        
        self.tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData(urlToFetch : String){
        print(urlToFetch)
        
        AF.request(urlToFetch).responseJSON { (responseData) -> Void in
            //print(responseData)
            let swiftJsonVar = JSON(responseData.data as Any)
            if let resData = swiftJsonVar["list"].arrayObject{
                
                self.arrRes = resData as! [[String:AnyObject]]
            }
            print(self.arrRes)
            
            if(self.arrRes.count>0){
                self.tableView.reloadData()
            }
            
        }
        
        //print(arrRes)
        
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    
    
    /*  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     
     }*/
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return self.arrRes.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // Configure the cell...
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath)
        
        var dict = arrRes[indexPath.row]
        // print(dict["serviceNumber"])
        //cell.textLabel?.text = dict["serviceNumber"] as? String
        cell.textLabel?.text = "Service Number :\(dict["serviceNumber"]!) BookingId:\(dict["bookingId"]!)"as? String
        return cell
        
        
    }
    /*  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     var dict = arrRes[indexPath.row]
     
     let bookingId = dict["bookingId"] as? Int
     let serviceNumber = dict["serviceNumber"] as? String
     let email = dict["email"] as? String
     let dateofJrny = dict["dateofJrny"] as? String
     
     
     let result = "id: \(id!) \n First Name: \(fname!)\n Last Name: \(lname!)\nFull Name: \(fullname!) \nEmail: \(mail!)\nContact: \(phone!)\n"
     
     let alertController = UIAlertController(title: "Employee Details ", message: result, preferredStyle: .alert)
     
     alertController.addAction(UIAlertAction(title: "Dismiss" , style: .default ))
     
     self.present(alertController,animated: true,completion: nil)
     
     }*/
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
