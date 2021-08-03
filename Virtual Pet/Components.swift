//
//  Components.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .multilineTextAlignment(.center)
    }
}

struct StatusDisplay: View {
    var iconSystemName = ""
    var iconImageName = ""
    let statusValue: Int
    
    var body: some View {
        HStack {
            if iconSystemName != "" {
                Image(systemName: iconSystemName)
                    .resizable()
                    .frame(width: 30, height: 30)
            } else {
                Image(iconImageName)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("\(statusValue)/100")
        }
    }
}
