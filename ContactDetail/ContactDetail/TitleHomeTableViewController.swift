import UIKit


class TitleHomeTableViewController: UITableViewController {


    @IBOutlet var MyTableView: UITableView!
    @IBOutlet var detailLbel: UILabel!
    
    
    //MARK:- View Life Cycle
    
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true);
    self.tableView.reloadData();
}

    override func viewDidLoad() {
        super.viewDidLoad()
      }

    //MARK :- Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
// MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  DbFIghter.sharedInstance().students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Firstcell", for: indexPath) as! HomeTableViewCell
       
        cell.ContactName?.text        =   DbFIghter.sharedInstance().students[indexPath.row].name ?? ""
        cell.ContactNumberLabel?.text  =  DbFIghter.sharedInstance().students[indexPath.row].mob ?? ""
        cell.contactImage.image       =  DbFIghter.sharedInstance().students[indexPath.row].imgStudent ?? UIImage()
        return cell
    }
   
// Mark : - delete cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexpath: IndexPath)
    {
        if editingStyle == .delete
          {
            print(indexpath.row)
            DbFIghter.sharedInstance().removeStudentAt(index: indexpath.row);
            tableView.reloadData()
          }
     }
  
    //MARK:-  Segue Method - from HomeTableVC -> DetailViewController
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    let storyboard  = UIStoryboard.init(name: "Main", bundle: nil);
    let vc:TitleDetailViewController =  storyboard.instantiateViewController(withIdentifier: "detail") as! TitleDetailViewController;
       vc.index = indexPath.row;
    self.navigationController?.pushViewController(vc, animated: true);
    }
}












    
    
    
   

 

