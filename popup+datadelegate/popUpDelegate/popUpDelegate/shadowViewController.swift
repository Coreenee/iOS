//
//  shadowViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/26.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class shadowViewController: UIViewController {
    @IBOutlet weak var outerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.gray.cgColor
        outerView.layer.shadowOpacity = 0.3
        outerView.layer.shadowOffset = CGSize(width: 10, height: 15)
        outerView.layer.shadowRadius = 10
        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 10).cgPath
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
