
import UIKit

struct Data
{
    var dataOfName = 0
    var dataOfFather:[String] = []
    var dataOfMobile:[String] = []
    var dataOfCollege:[String] = []
    
    var imageData : UIImage!
}

var structure = [Data]()

class DataManager: NSObject
   {
    static let sharedinstance:DataManager = DataManager()
   }
