//
//  DisplayData.swift
//  DemoSwift
//
//  Created by Megha on 03/12/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit

class DisplayData: UIViewController {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblNo: UILabel!
     var obj1 = Student();
    
    
    //MARK: UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("obj1 ===>",obj1)
        self.lblNo.text = obj1.number
        self.lblname.text = obj1.name
        self.lblAddress.text = obj1.address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
