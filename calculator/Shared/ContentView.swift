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
    case ac, plusMius,percent
    
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

struct ContentView: View {
    
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
                    Text("42").font(.system(size: 64))
                        .foregroundColor(.white)
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { button in
                            
                            Button(action: {
                                
                            }){
                                Text(button.title).font(.system(size: 32))
                                    .frame(width: self.buttonWidth(button: button), height:
                                            (UIScreen.main.bounds.width - 5 * 12) / 4)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalculatorButton)->CGFloat{
        if button == .zero{
            return (UIScreen.main.bounds.width - 5 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
