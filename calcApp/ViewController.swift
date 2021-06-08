//
//  ViewController.swift
//  calcApp
//
//  Created by Yuu Tanaka on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var count: Int = 0
    var point_count: Int = 0
    var prevNumber: Double = Double()
    var arithmetic_operator: String = String()
    var answer: Double = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tapNumber(_ sender: UIButton) {
        resetButton.setTitle("C", for: .normal)
        if count == 0 {
            if (sender.titleLabel?.text)! == "0" {
                calcLabel.text! = (sender.titleLabel?.text)!
                return
            } else if (sender.titleLabel?.text)! == "." {
                calcLabel.text! += (sender.titleLabel?.text)!
                count += 1
                point_count += 1
                return
            }
        }
        count += 1
        
        // 一回目はラベルの0がいらない
        if count == 1 {
            calcLabel.text! = ""
        }
        // 小数点は一回だけ使える
        if (sender.titleLabel?.text)! == "." {
            point_count += 1
            if point_count >= 2 {
                return
            }
        }
        calcLabel.text! += (sender.titleLabel?.text)!
    }
    
    @IBAction func arithmeticButton(_ sender: UIButton) {
        prevNumber = Double(calcLabel.text!)!
        arithmetic_operator = (sender.titleLabel?.text)!
        resetCount()
    }
    
    
    @IBAction func equalButton(_ sender: Any) {
        switch arithmetic_operator {
        case "＋":
            answer = prevNumber + Double(calcLabel.text!)!
            break
        case "−":
            answer = prevNumber - Double(calcLabel.text!)!
            break
        case "×":
            answer = prevNumber * Double(calcLabel.text!)!
            break
        case "÷":
            answer = prevNumber / Double(calcLabel.text!)!
            break
        default:
            break
        }
        if String(answer) == "inf" {
            calcLabel.text = "エラー"
        } else {
            calcLabel.text = String(answer)
        }
        resetCount()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resetButton.setTitle("CA", for: .normal)
        resetCount()
        calcLabel.text! = "0"
        arithmetic_operator = ""
        prevNumber = 0
        answer = 0
    }
    
    func resetCount() -> Void {
        count = 0
        point_count = 0
    }
    
    
}
