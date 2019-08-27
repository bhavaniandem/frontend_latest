//
//  sleeperViewController.swift
//  Test1
//
//  Created by Apple on 24/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class sleeperViewController: UIViewController , SleeperselectorDelegate {
    var seatcount:Int=0
    var myFrom:String?
    var myTo:String?
    var myDateOfJourney:String?
    var myServiceNo:String?
    var mySeat:String?
    //var myseatprice:String="1500"
    var myPrice:Int?
    var myStartTime:String?
    var myDuration:Int?
    var totalprice:Int?

    @IBAction func Next(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map2:String =   "dd___dd/" +
            
            
            "aa___du/" +
            
            "aa___ua/" +
            
            "ua___aa/" +
            
            "aa___uu/" +
            
        "aauuaau/"
        
        let seats = Sleepselector()
        seats.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 250)
        seats.setSeatSize(CGSize(width: 40, height: 40))
        seats.setAvailableImage(   UIImage(named: "a")!,
                                   andUnavailableImage:    UIImage(named: "u")!,
                                   andDisabledImage:       UIImage(named: "d")!,
                                   andSelectedImage:       UIImage(named: "s")!)
        seats.layout_type = "Normal"
        seats.setMap(map2)
       // print("priyaa")
        //seats.seat_price           = 1500
        seats.selected_seat_limit  = 2
        seats.seatSelectorDelegate = self
        seats.maximumZoomScale         = 5.0
        seats.minimumZoomScale         = 0.05
        totalprice = self.myPrice

        self.view.addSubview(seats)
        
        
    }
    
    func seatSelected(_ seat: ZSeat1) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    func getSelectedSeats(_ seats: NSMutableArray) {
        
        mySeat=""
        seatcount=0
        for i in 0..<seats.count {
            seatcount+=1
            print("count is\(seatcount)")
            let seat:ZSeat1  = seats.object(at: i) as! ZSeat1
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            //total = seat.price
            if(mySeat=="")
            {
                mySeat=String(seat.row) + String(seat.column)
            }
            else
            {
                mySeat = mySeat! + ", " + String(seat.row) + String(seat.column)
            }
            print(mySeat!)
        }
        print("----- Total -----\n")
       // print("----- \(total) -----\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title=nil
        print("hi")
        if segue.identifier=="seat"{
            print("hello")
            let s=segue.destination as! Preview
            
            
            s.myFrom=self.myFrom
            s.myTo=self.myTo
            s.myDateOfJourney=self.myDateOfJourney
            s.myServiceNo=self.myServiceNo
            s.mySeatNo = self.mySeat
            s.myPrice = self.myPrice! * seatcount
            print("mounika")
            print(self.myPrice!)
            s.myDuration=self.myDuration
            s.myStartTime = self.myStartTime
            
            
        }
    }
    
}
