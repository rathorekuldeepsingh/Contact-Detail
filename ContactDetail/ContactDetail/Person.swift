
import UIKit

struct  Person
{
    var name :String?
    var fatherName :String?;
    var collageName :String?;
    var mob :String?;
    var imgStudent:UIImage?
    var dateOfBirth:String?
    
    init(name:String = "abc",fatherName:String? = "vc",collageName:String? = "jecrc",mob:String? = "348953498",dateOfBirth:String? = "1234",imgStudent:UIImage? = UIImage())
    {
            self.name = name;
       self.fatherName = fatherName;
     self.collageName = collageName;
             self.mob = mob;
       self.imgStudent = imgStudent;
       self.dateOfBirth = dateOfBirth
    }
    


}
