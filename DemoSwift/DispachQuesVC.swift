//
//  DispachQuesVC.swift
//  DemoSwift
//
//  Created by Megha on 21/01/18.
//  Copyright © 2018 com.parmar. All rights reserved.
//

import UIKit

class DispachQuesVC: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // without Paramater function & block
     
        self.getFunc()
        self.getBlock()
        // with Paramater function & block
        self.paramPasssing(name:"Welcome Pravin")
        let  backPassing = self.block1(" good Night....")
        print(backPassing)
        
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                print("Call Maub Mathred ....")
            }
            print("High priority")
        }
        DispatchQueue.global(qos: .utility).async {
            print("Low priority")
        }
        DispatchQueue.main.async {
            print("Main Queue...")
        }
        //
        DispatchQueue.main.sync {
        
        }
        
        // Call Block
        blockRun(strPass:"Text Passing",completion:blockCall)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var blockCall = {
        print("Block Finish.....")
    }
    
    // block
    func blockRun(strPass:NSString, completion:()->())  {
        completion()
        print(strPass)
    }
    // without  Parameter
    func  getFunc(){
        print("Call Function...")
    }
    var getBlock = {() -> () in
    print("Call Block .....")}
    //With Parameter
    func paramPasssing(name: NSString){
        print("Parameter :-\(name)")
    }

     var block1 = { (name: String) -> String in
      "hello \(name)"
    }

}
