//
//  SeatSelectionViewController.swift
//  Test1
//
//  Created by Apple on 8/24/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class SeatSelectionViewController: UIViewController , ZSeatSelectorDelegate {
    var seatcount:Int=0

   
    //var total:Float = 0.0;
    
    
     var myFrom:String?
     var myTo:String?
     var myDateOfJourney:String?
     var myServiceNo:String?
     var mySeat:String?
     var myPrice:Int?
     var myStartTime:String?
     var myDuration:Int?
    var totalprice:Int?
 
    
    @IBAction func next(_ sender: Any) {
       
       
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let map2:String =   "DD___DD/" +
            
            
            "AA___DU/" +
            
            "AA___UA/" +
            
            "UA___AA/" +
            
            "AA___UU/" +
            
            "AA___AA/" +
            
        "AAUAUAA/"
        
        let seats = ZSeatSelector()
        seats.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 500)
        seats.setSeatSize(CGSize(width: 40, height: 40))
        seats.setAvailableImage(   UIImage(named: "A")!,
                                    andUnavailableImage:    UIImage(named: "U")!,
                                    andDisabledImage:       UIImage(named: "D")!,
                                    andSelectedImage:       UIImage(named: "S")!)
        seats.layout_type = "Normal"
        seats.setMap(map2)
        
        seats.selected_seat_limit  = 2
        seats.seatSelectorDelegate = self
        seats.maximumZoomScale         = 5.0
        seats.minimumZoomScale         = 0.05
        
        totalprice = self.myPrice 
        self.view.addSubview(seats)
        
        
        
    }
    
    func seatSelected(_ seat: ZSeat) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    func getSelectedSeats(_ seats: NSMutableArray) {
        //var total:Float = 0.0;
        mySeat=""
        seatcount=0
        for i in 0..<seats.count {
            
            seatcount+=1
            print("count is\(seatcount)")

            let seat:ZSeat  = seats.object(at: i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
        
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
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        self.navigationItem.title=nil
        if segue.identifier=="seatseltopreview"{
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
