//
//  ViewController.swift
//  DZL4.1
//
//  Created by Macbook on 04.02.2019.
//  Copyright © 2019 Nikolay_Romanov. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Count character in my name is \(myName(name: "Nikolay"))")
        
        print("Отчество заканчивается на \(myMiddleName(middledName: "Олександрович"))")
        
        print("Separation name \(separationName(name: "NikolayRomanov"))")
        
        print("Mirror string \(reverseStr(str: "Ocb"))")
        
        print("Calculator String - \(calculatorString(number: 1234567))")
        
        safetyOfPassword(password: "123sd+DC")
        
        print("Sorted array \(sortedFunc(array: [7, 6, 5, 10, 1, 10, 5, 4, 9, 3, 2, 1]))")
        
        print("Translit - \(translitFunc(str: "ЯЗЗЬ"))")
        
        print("Search 'da' in ['lada', 'sedan', 'baklazhan'] - result is - \(searchInArray(strArray: ["lada", "sedan", "baklazhan"], searchStr: "da"))" )
        
        print("Primer func antimat Hello my fuck - \(antimat(str: "Hello my fuck", matSet: ["fuck", "fuk"]))")
    }
    
    // Задача 1 -----> Создать строку с своим именем, вывести количество символов содержащихся в ней.
    func myName(name: String) -> Int {
        return name.count
    }
    // Задача 1 <-----
    
    // Задача 2 -----> Создать строку с своим отчеством проверить его на окончание “ич/на”
    func myMiddleName(middledName: String) -> String {
        if middledName.hasSuffix("ич") {
            return "ич"
        }
        if middledName.hasSuffix("на") {
            return "на"
        }
        return "!Введите корректно Отчество!"
    }
    // Задача 2 <-----
    
    // Задача 3 -----> Cоздать строку, где слитно написано Ваши ИмяФамилия “IvanVasilevich" Вам нужно разбить на две отдельных строки из предыдущей создать третью, где они обе будут разделены пробелом
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
    // Задача 3 <-----
    
    // Задача 4 -----> Вывести строку зеркально Ось → ьсО не используя reverse (посимвольно)
    func reverseStr(str: String) -> String {
        var reversStr = ""
        for i in str {
            reversStr.insert(i, at: reversStr.startIndex)
        }
        return reversStr
    }
    // Задача 4 <-----
    
    // Задача 5 -----> Добавить запятые в строку как их расставляет калькулятор
    func calculatorString(number: Int) -> String {
        var numberStr = String(number)
        for i in (-numberStr.count)...(-1) {
            if (i % 3 == 0) && (-i != numberStr.count) {
                numberStr.insert(contentsOf: ",", at: numberStr.index(numberStr.endIndex, offsetBy: i))
            }
        }
        return numberStr
    }
    // Задача 5 <-----
    
    // Задача 6 -----> Проверить пароль на надежность от 1 до 5
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
    // Задача 6 <-----
    
    // Задача 7 -----> Сортировка массива не встроенным методом по возрастанию + удалить дубликаты
    func  sortedFunc(array: [Int]) -> [Int] {
        var arrayFunc = array
        var sortedArray = [Int].init()
        for _ in 0...(array.count - 1) {
            let minValue = arrayFunc.min()!
            if !sortedArray.contains(minValue) {
                sortedArray.append(minValue)
            }
            arrayFunc.remove(at: arrayFunc.index(of:minValue)!)
        }
        return sortedArray
    }
    // Задача 7 <-----
    
    // Задача 8 -----> Написать метод, который будет переводить строку в транслит.
    func translitFunc(str: String) -> String {
        var strTranslit = ""
        let dictionaryTranslit = ["А": "A", "Б": "B", "В": "V", "Г": "G", "Д": "D", "Е": "E", "Ё": "YO", "Ж": "G", "З": "Z", "И": "I", "Й": "Y", "К": "K", "Л": "L", "М": "M", "Н": "N", "О": "O", "П": "P", "Р": "R", "С": "S", "Т": "T", "У": "U", "Ф": "F", "Х": "H", "Ц": "C", "Ч": "CH", "Ш": "SH", "Щ": "CH'", "Ы": "I", "Э": "E", "Ю": "YU", "Я": "YA",]
        for i in str {
            if String(i) == String(i).uppercased() {
                let charTranslit = (dictionaryTranslit[String(i)] != nil) ? dictionaryTranslit[String(i)]! : ""
                strTranslit.append(charTranslit)
            }
            else {
                let iUpperCased = String(i).uppercased()
                let charTranslit = (dictionaryTranslit[iUpperCased] != nil) ? dictionaryTranslit[iUpperCased]! : ""
                strTranslit.append(charTranslit.lowercased())
            }
        }
        return strTranslit
    }
    // Задача 8 <-----
    
    // Задача 9 -----> Сделать выборку из массива строк в которых содержится указанная строка
    func searchInArray(strArray: [String], searchStr: String) -> [String] {
        var searchInArray = [String].init()
        for i in strArray {
            if i.contains(searchStr) {
                searchInArray.append(i)
            }
        }
        return searchInArray
    }
    // Задача 9 <-----
    
    // Задача 10 -----> Set<String> - antimat [“fuck”, “fak”] “hello my fak” “hello my ***” использовать Set или NSSet для программы antimat - исключить из предложения все слова содержащиеся в сете
    func antimat(str: String, matSet: Set<String>) -> String {
        var strAnimat = String.init()
        var arrayWords = [String].init()
        var wordForArrayWords = String.init()
        
        for i in 0...(str.count - 1) {
            if String(str[str.index(str.startIndex, offsetBy: i)]) == " " {
                arrayWords.append(wordForArrayWords)
                wordForArrayWords = ""
            }
            
            if  String(str[str.index(str.startIndex, offsetBy: i)]) != " " {
                wordForArrayWords += String(str[str.index(str.startIndex, offsetBy: i)])
            }
            
            if i == (str.count - 1) {
                arrayWords.append(wordForArrayWords)
            }
        }
        
        for i in arrayWords {
            if !matSet.contains(i) {
                strAnimat += i + " "
            }
            else {
                strAnimat += "*** "
            }
        }
        strAnimat.removeLast()
        
        return strAnimat
    }
    // Задача 10 <-----
}

