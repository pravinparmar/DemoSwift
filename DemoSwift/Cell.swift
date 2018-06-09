//
//  Cell.swift
//  DemoSwift
//
//  Created by Megha on 19/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNo: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnUpDate: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
