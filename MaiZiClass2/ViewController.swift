//
//  ViewController.swift
//  MaiZiClass2
//
//  Created by 叶俊中 on 2016/11/6.
//  Copyright © 2016年 叶俊中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var upTitle: UILabel!
    @IBOutlet weak var upValue: UILabel!
    @IBOutlet weak var upIcon: UILabel!
    
    @IBOutlet weak var downTitle: UILabel!
    @IBOutlet weak var downValue: UILabel!
    @IBOutlet weak var downIcon: UILabel!
    var parites:Double = 6.7
    var pointFlag = false
    var fromUsdFlag = true
    @IBAction func numButton(_ sender: UIButton) {
        if upValue.text == "0" {
            upValue.text = "\(sender.currentTitle!)"
        }else{
            upValue.text = upValue.text! + "\(sender.currentTitle!)"
        }
        downValue.text = "0"
    }
    @IBAction func point(_ sender: UIButton) {
        if !pointFlag {
            upValue.text = upValue.text! + "."
            pointFlag = !pointFlag
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if upValue.text != "0" {
            var index = upValue.text!.index(upValue.text!.endIndex, offsetBy: -1)
            var subStr = upValue.text!.substring(to: index)
            if subStr == ""{
                upValue.text = "0"
            }else{
                upValue.text = upValue.text!.substring(to: index)
            }
            index = upValue.text!.index(upValue.text!.endIndex, offsetBy: -1)
            subStr = upValue.text!.substring(from: index)
            if subStr == "."{
                upValue.text = upValue.text!.substring(to:index)
                pointFlag = !pointFlag
            }
        }
        downValue.text = "0"
    }
    @IBAction func clearButton(_ sender: UIButton) {
        upValue.text = "0"
        downValue.text = "0"
        pointFlag = false
    }
    
    @IBAction func done(_ sender: UIButton) {
        let a = Double(upValue.text!)! * parites
        downValue.text = "\(a)"
    }
    @IBAction func changeButton(_ sender: UIButton) {
        let b = upValue.text
        let c = upIcon.text
        upValue.text = downValue.text!
        upIcon.text = downIcon.text!
        downValue.text = b
        downIcon.text = c
        if fromUsdFlag {
            upTitle.text = "从人民币"
            downTitle.text = "到美元"
            parites = 0.15
            fromUsdFlag = !fromUsdFlag
        }else{
            upTitle.text = "从美元"
            downTitle.text = "到人民币"
            parites = 6.7
            fromUsdFlag = !fromUsdFlag
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*        let h = UIScreen.main.bounds.size.width / 4
        for i in 0...3{//横向
            for j in 0...3{//纵向
                touchButton = UIButton(frame: CGRect(x: 0 + CGFloat(i) * h, y: UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.width + CGFloat(j) * h, width: h, height: h))
                touchButton.setBackgroundImage(UIImage(named:"block_black"), for: .normal)
                touchButton.layer.masksToBounds = true
                touchButton.tag = i * 10 + j
                if i < 3 && j < 3 {
                    touchButton.setTitle("\(i * 3 + j + 1)", for: .normal)
                }else if i == 3{
                    switch j {
                    case 0:
                        touchButton.setImage(UIImage(named:"delete"), for: .normal)
                    case 1:
                        touchButton.setTitle("0", for: .normal)
                    case 2:
                        touchButton.setTitle(".", for: .normal)
                    case 3:
                        touchButton.setTitle("=", for: .normal)
                        touchButton.setBackgroundImage(UIImage(named:"block_orange"), for: .normal)
                    default:
                        break
                    }
                }else if j == 3{
                    switch i {
                    case 0:
                        touchButton.setTitle("C", for: .normal)
                        touchButton.setBackgroundImage(UIImage(named:"block_orange"), for: .normal)
                    case 1:
                        touchButton.setTitle("-", for: .normal)
                    case 2:
                        touchButton.setTitle("+", for: .normal)
                    default:
                        break
                    }
                }
                self.view.addSubview(touchButton)
            }
        }
 */
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

