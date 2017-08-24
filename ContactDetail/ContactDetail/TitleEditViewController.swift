

import UIKit

class TitleEditViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    var isEdit:Bool? = false;
    var index:Int!
    var person:Person  = Person()
    let datePicker = UIDatePicker()
    var textField = 0
    var checkForUpdate:Int!
    
    
//Mark :- outlets
    @IBOutlet var InsertImage: UIImageView!
    @IBOutlet var GalleryAccessingButton: UIButton!
 
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var fatherNameTextField: UITextField!
    @IBOutlet var collegeNameTextField: UITextField!
    @IBOutlet var mobileNumberTextField: UITextField!
    @IBOutlet var dateOfBirthTextField: UITextField!
    
//MARK:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createDatePicker()
        self.InsertImage.layer.cornerRadius = self.InsertImage.frame.size.width/2 ;
        self.InsertImage.clipsToBounds = true
        self.toolbarOnKeyboard()
       
    }

    //MARK:- Gesture Function
    
//MARK:- keyboard Toolbar
    func toolbarOnKeyboard(){
        //MARK :- keyboard  done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donebtnClicked))
        
        let next = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.keyboardNextButton))
        let previous = UIBarButtonItem(title: "Previous", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.keyboardPreviousButton))
        
        toolbar.setItems([doneButton,next,previous], animated: false)
        nameTextField.inputAccessoryView        =   toolbar
        fatherNameTextField.inputAccessoryView  = toolbar
        collegeNameTextField.inputAccessoryView  = toolbar
        mobileNumberTextField.inputAccessoryView = toolbar
    }

func donebtnClicked(){ view.endEditing(true)
    }
    
func keyboardNextButton()
    {
      if nameTextField.tag == 1{
        fatherNameTextField.becomeFirstResponder()
        }
      else if fatherNameTextField.tag == 2{
            collegeNameTextField.becomeFirstResponder()
        }
      else  if collegeNameTextField.tag == 3{
            mobileNumberTextField.becomeFirstResponder()
        }
    }
    
    
    func keyboardPreviousButton(){
        
       if fatherNameTextField.tag == 2{
        nameTextField.becomeFirstResponder()
       }else if collegeNameTextField.tag == 3{
            fatherNameTextField.becomeFirstResponder()
        }else if mobileNumberTextField.tag == 4{
            collegeNameTextField.becomeFirstResponder()
        }
    }


    
    @IBOutlet var SaveButton: UIButton!

    //Mark : - Action
    
    //Save Button
    @IBAction func saveButton(_ sender: UIButton) {
     
    
        if (nameTextField.text)! != "" && (fatherNameTextField.text)! != "" && (collegeNameTextField.text)! != "" && (mobileNumberTextField.text)! != ""
        {
            
            self.createAlert(title: "Alert", message: " Your Data is Saved Succesfully")
          //  self.navigationController?.popToRootViewController(animated: true);
            
        }
        
        
        else if (self.nameTextField.text)! == ""
        {
            self.alertOnly(title: "Alert", message: "Please Enter the Name")
        }
        
        else if (self.fatherNameTextField.text)! == ""
        {
            self.alertOnly(title: "Alert", message: "Please Enter the Father Name")
        }
        
        else if (self.collegeNameTextField.text)! == ""
        {
            self.alertOnly(title: "Alert", message: "Please Enter the College Name")
        }
        else if (self.mobileNumberTextField.text)! == ""
        {
            self.alertOnly(title: "Alert", message: "Please Enter the Mobile Number")
        }
            
            
            
         }
    
    
    func createAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:
            UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.default,handler:{(action)in alert.dismiss(animated: true, completion: nil)
            
            if self.isEdit! == false{
                //add
                self.person.name = self.nameTextField.text ?? "";
                self.person.fatherName = self.fatherNameTextField.text ?? "";
                self.person.collageName = self.collegeNameTextField.text ?? "";
                self.person.mob = self.mobileNumberTextField.text ?? "";
                self.person.dateOfBirth = self.dateOfBirthTextField.text ?? "";
                self.person.imgStudent = self.InsertImage.image ?? UIImage();
                
                //call db and save
                DbFIghter.sharedInstance().addStudent(student: self.person);
                self.navigationController?.popToRootViewController(animated: true);
            }
                
                
            else{
                //edit
                let person:Person = Person(name: self.nameTextField.text ?? "", fatherName: self.fatherNameTextField .text ?? "", collageName: self.collegeNameTextField.text ?? "", mob: self.mobileNumberTextField.text ?? "", dateOfBirth:self.dateOfBirthTextField.text,imgStudent:  self.InsertImage.image);
                
                DbFIghter.sharedInstance().editStudentAt(index: self.index, student: person);
                self.navigationController?.popViewController(animated: true)
                }}))
        
  //Alert Method
         alert.addAction(UIAlertAction(title: "Cancel",style: UIAlertActionStyle.cancel,handler:{(action)in alert.dismiss(animated: true, completion: nil)}))
         self.present(alert,animated: true, completion:  nil)
        
}
    

//MARK:- Alert Function
    func alertOnly(title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action)in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert,animated: true, completion:  nil)
    }

// back Button
    @IBAction func BackButton(_ sender: UIButton)
    {
    dismiss(animated: true, completion: nil)
    }
    

//MARK:- button for accessing gallery
    @IBAction func GalleryAccessingBtn(_ sender: UIButton)
   {
        let img = UIImagePickerController()
        img.delegate = self
        img.sourceType = UIImagePickerControllerSourceType.photoLibrary
        img.allowsEditing = false
        self.present(img ,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
       if let img = info[UIImagePickerControllerOriginalImage]  as?  UIImage{
          InsertImage.image = img
        }
    else{
    print("error")}
        
    dismiss(animated: true, completion: nil)
    }

    
//MARK :- keboard
    func dismissKeyboard()    {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if nameTextField == self.nameTextField {
            self.fatherNameTextField.becomeFirstResponder()
          }
    return true
    }
    
    @IBAction func btnDatePickerTaped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil);
        let vc:DatePickerViewController =  storyboard.instantiateViewController(withIdentifier: "DatePickerViewController") as! DatePickerViewController;
        vc.vcPrevious = self;
    }
 
// MARK :- date picker function
    func createDatePicker() {
        datePicker.datePickerMode = .date
    
    // ToolBar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
    
    // Bar button Item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector (donePressed))
    
        toolBar.setItems([doneButton], animated: true)
        dateOfBirthTextField.inputAccessoryView = toolBar
        
    // assigning date picker to text field
        dateOfBirthTextField.inputView = datePicker
    }

// Done Button
    func donePressed() {
    // format Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateOfBirthTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
