//
//  ContentView.swift
//  Shared
//
//  Created by daeyoung lee on 2021/10/19.
//

import SwiftUI

enum CalculatorButton: String{
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equal, plus, minus, multiply, divide
    case dot
    case ac, plusMius, percent
    
    var title: String{
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "/"
        case .dot: return "."
        case .ac: return "AC"
        case .plusMius: return "+/-"
        case .percent: return "%"
        }
    }
    
    var backgroundColor: Color{
        switch self {
        case .equal, .plus, .minus, .multiply, .divide:
            return .orange
        case .ac, .plusMius, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
}

class GolbalEnviroment: ObservableObject{
    @Published var value = "0"
    var operation = ""
    var prevValue = 0.0
    var checkOperation = false
    
    func receiveInput(calculatorButton: CalculatorButton){
        switch(calculatorButton){
        case .ac:
            initValue()
        case .equal:
            value = calc()
            break
        case .plus, .minus, .multiply, .divide:
            prevValue = Double(value)!
            operation = calculatorButton.title
            self.checkOperation = true
            break
        case .plusMius:break
        case .percent:
            value = String(0.01 * Double(value)!)
            break
        case .dot:
            if !value.contains("."){
                value += "."
            }
            break
        default:
            if self.value == "0" {
                value = calculatorButton.title
            }
            else if self.checkOperation == true && Double(value) == prevValue{
                value = calculatorButton.title
                self.checkOperation = false
            }
            else {
                self.value += calculatorButton.title
            }
            break
        }
    }
    
    func initValue(){
        value = "0"
        operation = ""
        prevValue = 0
    }
    
    func calc() -> String{
        switch(operation){
        case "+":
            return String(prevValue + Double(value)!)
        case "-":
            return String(prevValue - Double(value)!)
        case "X":
            return String(prevValue * Double(value)!)
        case "/":
            return String(prevValue / Double(value)!)
        default:
            return value
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GolbalEnviroment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMius, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal],
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Text(env.value).font(.system(size: CGFloat(getFontSize(count: env.value.count))))
                        .foregroundColor(.white)
                        
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { button in
                            
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func getFontSize(count: Int)->Int{
        
        if count < 7 { return 64 }
        else if count < 9 { return 54 }
        else if count < 11 { return 44 }
        else { return 34 }
    }
}

struct CalculatorButtonView: View {
    var button: CalculatorButton
    
    @EnvironmentObject var env: GolbalEnviroment

    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: self.button)
        }){
            Text(button.title).font(.system(size: 32))
                .frame(width: self.buttonWidth(button: button), height:
                        (UIScreen.main.bounds.width - 5 * 12) / 4)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        }
    }
    
    private func buttonWidth(button: CalculatorButton)->CGFloat{
        if button == .zero{
            return (UIScreen.main.bounds.width - 5 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GolbalEnviroment())
    }
}
