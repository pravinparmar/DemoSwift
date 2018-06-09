//
//  AddRecordVC.swift
//  DemoSwift
//
//  Created by Megha on 19/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit
import CoreData


class AddRecordVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNo: UITextField!
    @IBAction func btnSave(_ sender: Any) {
        btnAddRecord();
    }
    //let context =[AppDelegate .performSelector(onMainThread: <#T##Selector#>, with: <#T##Any?#>, waitUntilDone: <#T##Bool#>)]
    //let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    // MARK: UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: CoreDatabase
    func btnAddRecord(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let studentObj = NSEntityDescription.insertNewObject(forEntityName:"Student", into: context) as! Student        
        studentObj.name = txtName.text
        studentObj.number = txtNo.text
        studentObj.address = txtAddress.text
       // Stream
        
        let streameObj  = NSEntityDescription.insertNewObject(forEntityName:"Stream", into: context) as! Stream
        streameObj.science = "12"
        streameObj.commerce = "11"
        streameObj.artce = "11"

        do {
            try context.save()
            print("Add record success")
            self.navigationController!.popViewController(animated: true)
        } catch {
            print("Failed saving")
        }

    }

}
//

