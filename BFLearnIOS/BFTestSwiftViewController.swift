//
//  BFTestSwiftViewController.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/3.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

import UIKit
import Alamofire
import JTAppleCalendar

extension BFLearnUIView {
    func indexOfString(aString:String) -> Int? {
        let index = __index(of: aString);
        if index == NSNotFound {
            return nil
        }
        return index
    }
}

class BFTestSwiftViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func testAlamofrie() {
      
    }

}
