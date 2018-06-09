//
//  customCell.swift
//  DemoSwift
//
//  Created by Megha on 19/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
     @IBOutlet weak var lblNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
