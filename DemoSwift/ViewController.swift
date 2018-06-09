//
//  ViewController.swift
//  DemoSwift
//
//  Created by Megha on 19/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import UIKit
import CoreData
//class Student
class Namelazy {
    
    var name : NSString = "Prakash ...."
}
class  Simple  {
    
    lazy var nameSample = Namelazy()
    
}
class StudentMark {
    
    var count: Int = 100
    var name : String
    var marks: Int
    //
    lazy var studentName = Namelazy ()
    init(name: String,mark: Int) {
        self.name = name
        self.marks = mark
    }
    
}
// Enum  Month
enum Month: Int {
    case Jan = 1 ,Feb,March,April,May,June
}
//enum
enum StudentEnum {
    case name(NSString)
    case mark(Int, Int,Int)
}
//struct
struct Marks {
    var m1:Int
    var m2:Int
    var m3:Int
    
    init(m1:Int,m2:Int,m3:Int) {
        
        self.m1 = m1
        self.m2 = m2
        self.m3 = m3
    }
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,CollectionVCDelegate{
    
    var  arrDataStudent:[Student] = [Student()]
    var  arrDataStream: NSMutableArray = []
    var  arrData2 : NSMutableArray = []
    let  arrTemp: [String] = ["A","B","C"]
    var obj1 = Student();
    var str: NSString = ""
    var dicttemp:NSMutableDictionary = NSMutableDictionary ()
    @IBOutlet weak var btnAddRecord: UIButton!
    @IBOutlet  var tblMain: UITableView!
    @IBOutlet weak var btnUpdate: UIButton!
    
    // MARK: UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // struct
        let struct1 = Marks.init(m1: 50, m2: 50, m3: 100)
        print("\(struct1.m1)")
        print("\(struct1.m2)")
        print("\(struct1.m3)")
        //Enum Month
        let month1 = Month.June.rawValue
        print("Month==> \(month1)")
        // enum StudentEnu
        //let  studentObj = StudentEnum.name("Jay")
        // let studMarks = StudentEnum.mark(98,97,95)
        
        //
        let simpleObj  = Simple()
        let studentObj1 = StudentMark(name: "Prakash", mark: 98)
        print("count==\(studentObj1.count)")
        print("name: -\(studentObj1.name) Marks:\(studentObj1.marks)")
        // lazy Property..
        print(" Lazy ==>\(simpleObj.nameSample.name)")
        self.tblMain.estimatedRowHeight = 100
        self.tblMain.rowHeight = UITableViewAutomaticDimension
        self.tblMain.register(UINib.init(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        //self.tblMain.register(UINib.init(nibName: "Cell", bundle: nil), forCellReuseIdentifier:"Cell")
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchRecordStream()
        fetchRecord2()
    }
    // MARK: UITableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrData2.count <= 0 {
            return 0
        }
        return self.arrData2.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : Cell = tableView.dequeueReusableCell(withIdentifier:"Cell",for: indexPath) as! Cell
        cell.btnUpDate.tag = indexPath.row;
        cell.btnUpDate.addTarget(self, action:#selector(btnUpdatePress(_:)), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row;
        cell.btnDelete.addTarget(self, action:#selector(btndeleteRecordPress(_:)), for: .touchUpInside)
        obj1  = self.arrData2 [indexPath.row] as! Student
        cell.lblNo.text = obj1.number
        cell.lblName.text = obj1.name
        cell.lblAddress.text = obj1.address
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addvc = self.storyboard?.instantiateViewController(withIdentifier: "DisplayData") as! DisplayData;
        obj1  = self.arrData2 [indexPath.row] as! Student
        addvc.obj1 = obj1
        self.navigationController?.pushViewController(addvc, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    //MARK: Button Action Method
    @IBAction func btnAddRecord(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil);
        //let addvc = storyboard.instantiateViewController(withIdentifier: "AddRecordVC") as! AddRecordVC;
        //self.navigationController?.pushViewController(addvc, animated: true)
        let addvc = storyboard.instantiateViewController(withIdentifier: "CollectionVC") as! CollectionVC;
       // addvc.delegates = self;
        self.navigationController?.pushViewController(addvc, animated: true)
        
        //
       // let  dispatch = storyboard.instantiateViewController(withIdentifier: "DispachQuesVC") as! DispachQuesVC
        //self.navigationController?.pushViewController(dispatch, animated:true)
        
        
        //
    }
    @IBAction func btndeleteRecordPress(_ sender: UIButton){
        obj1 = self.arrData2 [sender.tag] as! Student;
        print("Delete Obj1===>",obj1);
        let  appdelegate1 = UIApplication.shared.delegate as! AppDelegate;
        let managedObjectContext = appdelegate1.persistentContainer.viewContext
        managedObjectContext.delete(obj1)
        self.arrData2.removeObject(at: sender.tag)
        tblMain.reloadData()
        do {
            try managedObjectContext.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    @IBAction func btnUpdatePress(_ sender: UIButton) {
        obj1 = self.arrData2 [sender.tag] as! Student;
        let addvc = self.storyboard?.instantiateViewController(withIdentifier: "UPDateVC") as! UPDateVC;
        addvc.obj1 = obj1
        
        self.navigationController!.pushViewController(addvc, animated: true)
        
    }
    func fetchRecordStream() -> Void {
        let appdelete = UIApplication.shared.delegate as! AppDelegate
        let context = appdelete.persistentContainer.viewContext
        let  fetcRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "Stream")
        do {
            let result = try context.fetch(fetcRequest)
            let arrtemp = result as! [Stream]
            
            self.arrDataStream.add(arrtemp)
            print("arrtemp==>",arrtemp)
            
        } catch let err as NSError {
            print("error ==>",err)
        }
        
        for name in self.arrDataStream {
            //var
            print("==>%@",name);
        }
        //
        
        //array of names to find
        // let nameArray: [String] = ["Tom", "Tommy", "Thomas"]
        
        // find all Persons who have a nickname associated with that person
        let predicate = NSPredicate(format: "ANY student1.commerce == %@","12")
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetch.predicate = predicate
        let  fetchError : NSError? = nil
        
        
    }
    func fetchRecord() -> Void {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            let  StudentArr1 = results as! [Student]
            
            self.arrData2.add(StudentArr1)
            tblMain.reloadData()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    func fetchRecord2 (){
        self.arrData2.removeAllObjects()
        let  appdelegate1 = UIApplication.shared.delegate as! AppDelegate;
        let managedObjectContext = appdelegate1.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Student")
        
        do {
            let  result = try  managedObjectContext.fetch(fetchRequest)
            var   StudentArr1 = result as! [Student]
            self.arrData2.addObjects(from: result)
            //print("arrdata2 ====>",self.arrData2)
            tblMain.reloadData()
        } catch let err as NSError {
            print("",err)
        }
    }
    //MARK:- Delegates call
    func dictPassing(dictParam: NSDictionary) {
        
        print("Delegate Call  with Paramater :- ",dictParam)
    }
    
}
