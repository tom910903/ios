//
//  ContentView.swift
//  Shared
//
//  Created by daeyoung lee on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    var calculatorVM:CalcuatorVM = CalcuatorVM()
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                ResultView()
                KeyPadView()
            }
        }.environmentObject(calculatorVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
