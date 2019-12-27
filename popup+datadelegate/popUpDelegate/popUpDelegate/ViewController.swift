//
//  ViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

protocol sendBackDelegate {
    func dataReceived(data: String)
}



class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var completeView: UIView!
    @IBOutlet weak var UpView: UIView!
    @IBOutlet weak var sleepDay: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var avgPriceLabel: UILabel!
    
    var Day = 1
    let avgPrice = 2500000
    var totalP = 2500000
    var sendData = "" // data 전달을 위한 sendData
    var delegate : sendBackDelegate? // data 전달을 위한 delegate 선언
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sleepDay.text = "1 박"
        avgPriceLabel.text = "1박 평균 가격은 \(avgPrice) 원입니다."
        //view part view radius
        self.completeView.round(corners: [.bottomLeft, .bottomRight], cornerRadius: 15)
        //view part view border color
        self.UpView.layer.addBorder([.bottom], color: UIColor.gray, width: 0.5)
    }
    
    @IBAction func seeSafari(_ sender: Any) {
        if let url = URL(string: "http://naver.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    
    @IBAction func clickComplete(_ sender: Any) {
        delegate?.dataReceived(data: String(totalP)) // 계산한 전체 총값을 그 전 뷰에서 받는 것
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func minusDay(_ sender: Any) {
        if Day == 1{
           //Do nothing
        }
        else{
            Day = Day - 1
            sleepDay.text = "\(Day) 박"
            // 자릿수 표현 삽입
            totalP = Day * avgPrice
            totalPrice.text = String((Day * avgPrice).commaRepresentation) + "₩"
            sleepDay.sizeToFit()
            avgPriceLabel.sizeToFit()
            totalPrice.sizeToFit()
        }
    }
    @IBAction func plusDay(_ sender: Any) {
            Day = Day + 1
            sleepDay.text = "\(Day) 박"
            totalP = Day * avgPrice
            totalPrice.text = String((Day * avgPrice).commaRepresentation) + "₩"
            sleepDay.sizeToFit()
            avgPriceLabel.sizeToFit()
            totalPrice.sizeToFit()
    }
    
}








extension Int { //자릿수 표현 extension
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}


//원하는 부분 뷰 radius
extension UIView{
    func round(corners: UIRectCorner, cornerRadius: Double){
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}

//원하는 부분 뷰 테두리색
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
