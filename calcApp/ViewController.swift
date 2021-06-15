//
//  ViewController.swift
//  calcApp
//
//  Created by Yuu Tanaka on 2021/06/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var calcLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var zeroButton: RoundButton!
    @IBOutlet weak var tableView: UITableView!
    
    var answers: [String] = [String]()
    
    var count: Int = 0
    var point_count: Int = 0
    var prevNumber: Double = Double()
    var arithmetic_operator: String = String()
    var answer: Double = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        zeroButton.frame = CGRect(x: zeroButton.frame.origin.x, y: zeroButton.frame.origin.y, width: 160, height: 70)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = answers[indexPath.row]
        cell.textLabel!.textColor = .white
        cell.selectionStyle = .none
        return cell
    }

    @IBAction func tapNumber(_ sender: UIButton) {
        if count == 0 {
            if (sender.titleLabel?.text)! == "0" {
                calcLabel.text! = (sender.titleLabel?.text)!
                return
            } else if (sender.titleLabel?.text)! == "." {
                calcLabel.text! += (sender.titleLabel?.text)!
                count += 1
                point_count += 1
                resetButton.setTitle("C", for: .normal)
                return
            }
        }
        resetButton.setTitle("C", for: .normal)
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
            print(prevNumber)
            print(Double(calcLabel.text!)!)
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
        answers.append(String(answer))
        tableView.reloadData()
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
