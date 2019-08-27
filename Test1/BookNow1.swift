
import UIKit
import iOSDropDown

class BookNow1: UIViewController {
    
    @IBOutlet weak var textField: DropDown!
    @IBOutlet weak var DropDown3: DropDown!
    
    @IBOutlet weak var showbusses: UIButton!
    var filter:String=""
    var from:String=""
    var to:String=""
    var dateOfJourney:String=""
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var DropDown2: DropDown!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var txtDatePicker: UITextField!
        @IBOutlet weak var toLabel: UILabel!
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.optionArray = ["Hyderabad","Bangalore","Mumbai"]
        
        DropDown2.optionArray=["Hyderabad","Bangalore","Mumbai"]
        
        DropDown3.optionArray=["Seater","Sleeper"]
        
        //Its Id Values and its optional
        // textField.optionIds = [1,23,54,22]
        
        //textField.ImageArray = [👩🏻‍🦳,🙊,🥞]
        
        // The the Closure returns Selected Index and String
        textField.didSelect{(selectedText , index ,id) in
            self.from = selectedText
            print(self.from)
            print("hi")
            self.textField.showList()
            
        }
        
        self.DropDown2.didSelect{(selectedText , index ,id) in
            self.to=selectedText
            print(self.to)
            
            
            self.DropDown2.showList()
            // Do any additional setup after loading the view.
        }
        self.DropDown3.didSelect{(selectedText , index ,id) in
            self.filter=selectedText
            print(self.filter)
            
            
            self.DropDown2.showList()
            // Do any additional setup after loading the view.
        }
        showDatePicker()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title=nil
        if segue.identifier=="mySegue1"{
            print("heelo")
            let s=segue.destination as! BusList
            s.fromPlace=self.from
            //print("from in second \(s.from)")
            s.to=self.to
            s.dateOfJournery=self.dateOfJourney
            s.filter=self.filter
        }
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        dateOfJourney=txtDatePicker.text!
        print(dateOfJourney)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
}


