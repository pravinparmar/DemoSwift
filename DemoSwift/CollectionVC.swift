//
//  CollectionVC.swift
//  DemoSwift
//
//  Created by Megha on 11/01/18.
//  Copyright © 2018 com.parmar. All rights reserved.
//

import UIKit
protocol CollectionVCDelegate {
    func dictPassing(dictParam:NSDictionary)
}

class CollectionVC: UIViewController {
    
    var delegates: CollectionVCDelegate?
    
    @IBOutlet var collectionMain: UICollectionView!
    var arrMutable : [NSString] = [];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrMutable = ["A","B","C","D","E"]
        let dict = ["name": "Jay","City": "AMD"]
        self.delegates?.dictPassing(dictParam: dict as NSDictionary)
        
         let  s1 = simple1()
         let display = s1.simpleDescription
         var d2 = s1.Display()
        

        print("===>",display)
        print("===>",d2)

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension  CollectionVC: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.arrMutable.count;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
      public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let Cell1:collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! collectionCell
        Cell1.lblName.text = self.arrMutable[indexPath.row] as String
        return Cell1
    }
}
extension  CollectionVC: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("===\(indexPath.row)")
        print("Value ===>\(self.arrMutable[indexPath.row])")
    }
    
}

protocol SampleProtocol  {
    var simpleDescription : String { get}
    mutating func Display()
    
}

class simple1: SampleProtocol{
    
     var simpleDescription: String = "Welcome Test"
    
    func Display() {
        
        simpleDescription += " hello Testing"
    }

    
}
