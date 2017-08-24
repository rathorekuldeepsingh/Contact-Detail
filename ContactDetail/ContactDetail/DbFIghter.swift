
import UIKit

var fighter:DbFIghter! = nil;

class DbFIghter: NSObject
{
    lazy var students:[Person] = [Person]();
    class func sharedInstance()->DbFIghter
     {
        if fighter == nil {
            fighter = DbFIghter()
         }
        return fighter
     }
    
    //add 
    func addStudent(student:Person){
     self.students.append(student);
    }
    
    //edit
    func editStudentAt(index:Int,student:Person){
        self.students[index] = student;
    }
    
    //remove
    func removeStudentAt(index:Int)
    {
        self.students.remove(at: index);
    }

    func remove(){
       if fighter != nil{
            fighter = nil;
        }
    }
}
