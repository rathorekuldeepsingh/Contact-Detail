//
//  DatePickerViewController.swift
//  ContactDetail
//
//  Created by kuldeep singh on 6/21/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit

var index:Int! = -1

class DatePickerViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    var vcPrevious:TitleEditViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   let formatter = DateFormatter()
        formatter.dateFormat = "MMMM  dd, YYYY"
        dateLabel.text = formatter.string(from: datePicker.date)
    
   //     dateLabel.text = DbFIghter.sharedInstance().students[index].
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM  dd, YYYY"
        
        dateLabel.text = formatter.string(from: datePicker.date)
        
     //   vcPrevious.dateOfBirthTextField.text = dateLabel.text;
        
        
       // dateLabel.text = DbFIghter.sharedInstance().students[index].
    }
    
    @IBOutlet var datePickerAction: UIDatePicker!
    
    
    
   @IBAction func okButton(_ sender: UIButton) {
 //   print("date : \(dateLabel.text)")
    
  //  let person:Person = Person(dateOfBirth: dateLabel.text ?? "")
    let person:Person = Person(name: "", fatherName: "", collageName: "", mob: "", dateOfBirth: dateLabel.text)
    DbFIghter.sharedInstance().addStudent(student: person)

    self.navigationController?.popViewController(animated: true)
        
    }

     
}
