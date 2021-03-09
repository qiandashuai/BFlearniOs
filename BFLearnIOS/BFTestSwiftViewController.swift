//
//  BFTestSwiftViewController.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/3.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

import UIKit
import Alamofire

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
        view.backgroundColor = UIColor.red;
        let testView:BFLearnUIView = BFLearnUIView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 300, height: 300)));
        view.addSubview(testView)
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
