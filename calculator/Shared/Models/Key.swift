//
//  Key.swift
//  calculator (iOS)
//
//  Created by daeyoung lee on 2021/11/01.
//

import Foundation
import SwiftUI

enum KeyType{
    case Number
    case Operator
}

var operatorSymbols:[String:String] = [
    "+":"plus",
    "-":"minus",
    "*":"multiply",
    "/":"divide",
    "+/-":"plus.forwardslash.minus",
    "%":"percent",
    "=":"equal",
]

struct Key:Identifiable{
    var id:UUID = UUID()
    var label:String
    var color:Color = Color.secondary
    var labelColor:Color = Color.white
    var type:KeyType = KeyType.Number
}
