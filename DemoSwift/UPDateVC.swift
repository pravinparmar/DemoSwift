//
//  UPDateVC.swift
//  DemoSwift
//
//  Created by Megha on 04/12/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit
import CoreData

class UPDateVC: UIViewController {
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNo: UITextField!
     var obj1 = Student();
    //MARK: UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtNo.text = obj1.number
        self.txtName.text = obj1.name
        self.txtAddress.text = obj1.address


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSave(_ sender: Any) {
        btnUpdateRecord();
    }
    // MARK: CoreDatabase
    func btnUpdateRecord(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        obj1.name = txtName.text
        obj1.number = txtNo.text
        obj1.address = txtAddress.text
        do {
            try context.save()
            print("update record success")
            self.navigationController!.popViewController(animated: true)
        } catch {
            print("Failed saving")
        }
        
    }


  
}
