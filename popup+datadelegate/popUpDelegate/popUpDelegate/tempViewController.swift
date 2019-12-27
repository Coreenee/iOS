//
//  tempViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/26.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class tempViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //다음뷰에 정보 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //텍스트뷰로 받은 값 정수로 바꿔서 보내기
        var temp:String? = input.text
        
        if segue.identifier == "temp"{
            let vc = segue.destination as? MainViewController
            vc?.pgValue = Int(temp!)!
        }
        
        //다음 segue destination navigation item 이름 바꾸기
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is TertiaryViewController
        {
            let vc = segue.destination as? TertiaryViewController
            vc?.username = "Arthur Dent"
        }
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
