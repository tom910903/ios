//
//  ResultView.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/01.
//
import SwiftUI

struct ResultView:View{
    var value : String
    
    var body:some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text(self.value)
                    .foregroundColor(.white)
                    .font(.system(size: 90))
                    .padding(.trailing, 30)
            }
        }
    }
}
