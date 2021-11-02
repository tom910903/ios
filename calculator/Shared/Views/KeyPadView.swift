//
//  KeyPadView.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/01.
//

import SwiftUI

struct KeyPadView:View{
    @EnvironmentObject var calculatorVM:CalcuatorVM
    
    var body:some View{
        return VStack(spacing:15){
            let keys:[[Key]] = calculatorVM.getKeys()
            
            ForEach(0 ..< keys.count){ index in
                HStack(spacing:10){
                    ForEach(0..<keys[index].count){ innerIndex in
                        KeyView(key: keys[index][innerIndex])
                    }
                }
            }
        }
    }
}
