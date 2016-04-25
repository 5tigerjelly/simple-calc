//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/19/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var display : UILabel!

    var click = false
    
    @IBOutlet weak var historybox: UILabel!
    
    var calculating = false
    
    var history : [String] = []
    
    @IBAction func enterNumber(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if click {
            if calculating {
                display.text = digit
                calculating = false
            }else{
                display.text = display.text! + digit
            }
            
        }else{
            display.text = digit
            click = true
        }
    }
    
    
    var displayValue : Int {
        get {
            return NSNumberFormatter ().numberFromString(display.text!)!.integerValue
        }
        set{
            display.text = "\(newValue)"
            click = false
        }
    }
    
    @IBAction func clear(sender: UIButton){
        displayValue = 0
        display.text = "\(displayValue)"
        calculating = false
        count = 1
        averageSum = 0
    }
    
    var num1 : Int = 0
    var oper : String = ""
    var count : Int = 1
    var averageSum : Int = 0
    @IBAction func calculate(sender: UIButton){
        NSLog(sender.currentTitle!)
        if sender.currentTitle! == "fact" {
            num1 = displayValue
            var total = 1
            for i in 1 ... num1 {total *= i}
            display.text = "\(total)"
        }else if sender.currentTitle! == "=" {
            let num2 = displayValue
            NSLog("got in")
            var result = 0
            switch oper{
            case "+": result = num1+num2
            case "-": result = num1-num2
            case "x": result = num1*num2
            case "/": result = num1/num2
            case "%": result = num1%num2
            case "count": result = count
            case "avg":
                averageSum += num2
                result = averageSum / count
            default: NSLog("wrong operation input")
            }
            display.text = "\(result)"
            history.append("\(num1) \(oper) \(num2) = \(result)")
            let addtohis = ("\(num1) " + "\(oper)" + " \(num2)" + " = " + "\(result)\n")
            NSLog(addtohis)
            //historybox.text = historybox.text! + addtohis
            
        }else{
            num1 = displayValue
            oper = sender.currentTitle!
            switch sender.currentTitle!{
                case "count": count += 1
                case "avg": averageSum += num1
                    count += 1
                default:NSLog("not special value")
            }
            calculating = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

