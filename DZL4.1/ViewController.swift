//
//  ViewController.swift
//  DZL4.1
//
//  Created by Macbook on 04.02.2019.
//  Copyright © 2019 Nikolay_Romanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Count character in my name is \(myName(name: "Nikolay"))")
        
        print("Отчество заканчивается на \(myMiddleName(middledName: "Олександрович"))")
        
        print("Separation name \(separationName(name: "IvanVasilevich"))")
        
        print("Mirror string \(reverseStr(str: "Ocb"))")
        
        print("Calculator String - \(calculatorString(number: 1234567))")
        
        safetyOfPassword(password: "123sd+DC")
    }

    func myName(name: String) -> Int {
        return name.count
    }
    
    func myMiddleName(middledName: String) -> String {
        if middledName.hasSuffix("ич") {
            return "ич"
        }
        if middledName.hasSuffix("на") {
            return "на"
        }
        return "!Введите корректно Отчество!"
    }
    
    func separationName(name: String) -> (strFullName: String, strFirstName: String, strSecondName: String) {
        
        var strFullName = ""
        var strFirstName = ""
        var strSecondName = ""
        
        for i in name {
            if String(i) == String(i).uppercased() {
                strFullName.append(" ")
                strFullName.append(String(i))
            }
            else {
                strFullName.append(String(i))
            }
        }
        
        strFullName.remove(at: strFullName.startIndex)
        let index = strFullName.index(of: " ") ?? strFullName.endIndex
        strFirstName = String(strFullName[..<index])
        strSecondName = String(strFullName[index...])
        strSecondName.remove(at: strSecondName.startIndex)
        
        return (strFullName, strFirstName, strSecondName)
    }
    
    func reverseStr(str: String) -> String {
        var reversStr = ""
        for i in str {
            reversStr.insert(i, at: reversStr.startIndex)
        }
        return reversStr
    }
    
    func calculatorString(number: Int) -> String {
        var numberStr = String(number)
        for i in (-numberStr.count)...(-1) {
            if (i % 3 == 0) && (-i != numberStr.count) {
                numberStr.insert(contentsOf: ",", at: numberStr.index(numberStr.endIndex, offsetBy: i))
            }
        }
        return numberStr
    }
    
    func safetyOfPassword(password: String) {
        let num = "1234567890"
        let abc = "aqwertyuioplkjhgfdsazxcvbnm"
        let aBC = abc.uppercased()
        let symbols = "[];'/.,+=()~!_`"
        var safetyArray = [String]()
        var safetty = 0
        
        for i in password {
            if num.contains(i) {
                if !safetyArray.contains("a") {
                    safetyArray.append("a")
                    safetty += 1
                }
            }
            if  abc.contains(i) {
                if !safetyArray.contains("b") {
                    safetyArray.append("b")
                    safetty += 1
                }
            }
            if aBC.contains(i) {
                if !safetyArray.contains("c") {
                    safetyArray.append("c")
                    safetty += 1
                }
            }
            if symbols.contains(i) {
                if !safetyArray.contains("d") {
                    safetyArray.append("d")
                    safetty += 1
                }
            }
        }
        
        if safetyArray.count == 4 {
            safetty = 5
        }
        print("Password \(password) - \(safetty) \(safetyArray)")
    }
}

