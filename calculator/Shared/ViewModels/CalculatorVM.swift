//
//  CalculatorVM.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/02.
//

import SwiftUI

class CalcuatorVM: ObservableObject {
    @Published var result:String = "0"
    @Published var fontSize = 90
    
    func getFontSize(numberLength: Int){
        
        switch numberLength{
        case 7:
            self.fontSize = 80
        case 8:
            self.fontSize = 70
        case 9:
            self.fontSize = 60
        default:
            self.fontSize = 90
        }
    }
    
    func handleKeyPress(key:Key){
        switch key.label{
        case "AC":
            self.result = "0"
        case "C":
            self.result = "0"
        default:
            self.handleKeyPress(label:key.label)
        }
        self.getFontSize(numberLength: self.result.count)
    }
    
    func handleKeyPress(label:String){
        if (self.result.count == 0 || self.result.count < 9){
            self.result = self.result == "0" ? label : self.result + label
        }
    }
    
    func getKeys()->[[Key]]{
        let cancel = self.result == "0" ? "AC" : "C"
        return [
            [
                Key(label: cancel, color: Color.gray, labelColor: Color.black),
                Key(label: "+/-", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
                Key(label: "%", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
                Key(label: "/", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
            ],
            [
                Key(label: "7"),
                Key(label: "8"),
                Key(label: "9"),
                Key(label: "*", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
            ],
            [
                Key(label: "4"),
                Key(label: "5"),
                Key(label: "6"),
                Key(label: "-", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
            ],
            [
                Key(label: "1"),
                Key(label: "2"),
                Key(label: "3"),
                Key(label: "+", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
            ],
            [
            Key(label: "0"),
                Key(label: "."),
                Key(label: "=", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
            ]
        ]
    }
}
