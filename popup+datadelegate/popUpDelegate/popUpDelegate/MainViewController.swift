//
//  MainViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, sendBackDelegate{
   
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var nextOrComplete: UIButton!
    
    var menuSelected : [Int : Int] = [0:0, 1:0, 2:0, 3:0, 4:0] //딕셔너리 이용해서 [카테고리넘버 : 0(선택안됨), 1(선택됨)
    var menuCnt = 0 // 선택한 카테고리수
    var base = 0 //금액을 더할 때 기존 돈
    var pgValue: Int = 0 //프로그레스바 단계, 즉 고른 카테고리 수
    var start : Int = 1 //프로그래스바 checkvalue
    
    func dataReceived(data: String) {
        //print("check main datarecieve func")
        guard let getInt = Int(data) else {return}
        base = base + getInt
        totalPrice.text = String(base.commaRepresentation2) + "₩"
        //print(getInt)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로그래스바 전체 1.0에서 나누기로 진행
        if pgValue == 1{ //하나가 선택 됐을 때는 바로 완료
            nextOrComplete.setTitle("완료", for: .normal)
            progressBar.progress = Float(1.0 / Double(pgValue))
        }
        else{   //여러개 선택됐을 때는 시작이 다음
            nextOrComplete.setTitle("다음", for: .normal)
            progressBar.progress = Float(1.0 / Double(pgValue))
        }
        //progressBar.progress = Float(1.0 / Double(pgValue))
        // Do any additional setup after loading the view.
    }
    
    //데이터 송신에 필요한 부분
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showPopup"{
            //print("check main prepare")
            let secondVC = segue.destination as! ViewController
            secondVC.sendData = totalPrice.text!
            secondVC.delegate = self
        }
    }
    
    
    
    //프로그래스바 진행률 더할 때
    @IBAction func changeProgress(_ sender: Any) {
        print(pgValue)
        print(start)
        if start == pgValue{
            progressBar.progress = Float(start) * Float(1.0/Double(pgValue))
            nextOrComplete.setTitle("완료", for: .normal)
            nextOrComplete.setTitleColor(.red, for: .normal)
        }
        else if start < pgValue{
            start = start + 1
            progressBar.progress = Float(start) * Float(1.0/Double(pgValue))
            
        }
        
    }
    
    
    
    
    //아래는 메뉴 선택시 변수조작
    
    @IBAction func menu1(_ sender: Any) {
        if menuSelected[0] == 0{
           menuSelected[0] = 1
           menuCnt = menuCnt + 1
        }
        else{
            menuSelected[0] = 0
            menuCnt = menuCnt - 1
        }
    }
    
    @IBAction func menu2(_ sender: Any) {
        if menuSelected[1] == 0{
           menuSelected[1] = 1
           menuCnt = menuCnt + 1
        }
        else{
            menuSelected[1] = 0
            menuCnt = menuCnt - 1
        }
    }
    
    @IBAction func menu3(_ sender: Any) {
        if menuSelected[2] == 0{
           menuSelected[2] = 1
           menuCnt = menuCnt + 1
        }
        else{
            menuSelected[2] = 0
            menuCnt = menuCnt - 1
        }
    }
    
    @IBAction func menu4(_ sender: Any) {if menuSelected[3] == 0{
           menuSelected[3] = 1
           menuCnt = menuCnt + 1
        }
        else{
            menuSelected[3] = 0
            menuCnt = menuCnt - 1
        }
        
    }
    
    @IBAction func menu5(_ sender: Any) {if menuSelected[4] == 0{
           menuSelected[4] = 1
           menuCnt = menuCnt + 1
        }
        else{
            menuSelected[4] = 0
            menuCnt = menuCnt - 1
        }
    }
    
 // 세그없이 팝업창 띄우기
//    @IBAction func showPopup(_ sender: Any) {
//                //print(menuCnt)
//                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//                let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupViewController")
//                popupVC.modalPresentationStyle = .overCurrentContext
//                present(popupVC, animated: true, completion: nil)
//
//    }
//
}



extension Int { //자릿수 표현 extension
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var commaRepresentation2: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
