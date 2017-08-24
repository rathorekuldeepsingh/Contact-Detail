
import UIKit

class TitleDetailViewController: UIViewController {

    var index:Int!  = 0
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var fatherLabel: UILabel!
    @IBOutlet var collegeLabel: UILabel!
    @IBOutlet var mobilenumberLabel: UILabel!
    @IBOutlet var imageInDetailVC: UIImageView!
    @IBOutlet var dateOfBirth: UILabel!
    @IBOutlet var dateOfBirthLabel: UILabel!
    
    @IBOutlet var cancelButton: UIBarButtonItem!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = DbFIghter.sharedInstance().students[index].name ?? "";
        mobilenumberLabel.text = DbFIghter.sharedInstance().students[index].mob ?? "";
        fatherLabel.text = DbFIghter.sharedInstance().students[index].fatherName ?? "";
        collegeLabel.text = DbFIghter.sharedInstance().students[index].collageName ?? "";
        imageInDetailVC.image = DbFIghter.sharedInstance().students[index].imgStudent ?? UIImage();
        dateOfBirthLabel.text = DbFIghter.sharedInstance().students[index].dateOfBirth ?? ""
        
        //Making the Image in circle
        self.imageInDetailVC.layer.cornerRadius = self.imageInDetailVC.frame.size.width/2 ;
        self.imageInDetailVC.clipsToBounds = true
        
    }

    //MARK:- Memory management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func backButton(_ sender: UIButton) {
        print("move withot saving")
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    //  detail -->> edit
    @IBAction func editTaped(_ sender: Any)
    {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil);
        let vc:TitleEditViewController =  storyboard.instantiateViewController(withIdentifier: "editAdd") as! TitleEditViewController;
        vc.index  = index;
        vc.isEdit = true;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    

}
