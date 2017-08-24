//  Created by kuldeep singh on 6/15/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import UIKit

class HomeTableViewCell: UITableViewCell {


    @IBOutlet var ContactName: UILabel!
    @IBOutlet var ContactNumberLabel: UILabel!
    @IBOutlet var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       self.contactImage.layer.cornerRadius = self.contactImage.frame.size.width/2 ;
        self.contactImage.clipsToBounds = true
        
    }
   override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   }

}
