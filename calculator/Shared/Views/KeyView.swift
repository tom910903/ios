//
//  KeyView.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/01.
//

import SwiftUI

struct KeyView:View{
    var key:Key
    @Binding var value:String
    
    var body: some View{
        let width = key.label == "0" ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width / 4
        let height = UIScreen.main.bounds.width / 4
        
        return Button(action: {
            self.value = self.value == "0" ? self.key.label : self.value + self.key.label
        })
        {
            RoundedRectangle(cornerRadius: 200)
                .foregroundColor(key.color)
                .frame(width: width - 10, height: height - 10, alignment: .center)
                .overlay(
                    Group{
                        if(key.type == KeyType.Number){
                            Text(key.label)
                                .font(.system(size:40))
                                .foregroundColor(key.labelColor)
                                .padding(.trailing, self.key.label == "0" ? width - 112 : 0)
                        }else{
                            Image(systemName: operatorSymbols[key.label] ?? "plus")
                                .font(.system(size: 30))
                                .foregroundColor(key.labelColor)
                        }
                    }
                )
        }
    }
}
