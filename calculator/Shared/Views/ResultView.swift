//
//  ResultView.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/01.
//
import SwiftUI

struct ResultView:View{
    @EnvironmentObject var calculatorVM:CalcuatorVM
    
    var body:some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text(calculatorVM.result)
                    .foregroundColor(.white)
                    .font(.system(size: CGFloat(calculatorVM.fontSize)))
                    .padding(.trailing, 30)
            }
        }
    }
}
