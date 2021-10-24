//
//  calculatorApp.swift
//  Shared
//
//  Created by daeyoung lee on 2021/10/19.
//

import SwiftUI

@main
struct calculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GolbalEnviroment())
        }
    }
}
