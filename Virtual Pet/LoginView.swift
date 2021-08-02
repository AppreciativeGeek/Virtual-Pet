//
//  LoginView.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import SwiftUI

struct LoginView: View {
    @State private var userName = String()
    @State private var petName = String()
    @State private var petType = String()
    
    var body: some View {
        VStack {
            Text("What is your name?")
            CustomTextField(placeholder: "Your name", variable: $userName)
                .padding()
            Text("What would you like your pet's name to be?")
            CustomTextField(placeholder: "Your pet's name", variable: $petName)
                .padding()
            Text("What kind of pet would you like to have?")
            Picker("", selection: $petType) {
                Text("dog").tag("dog")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Button(action: {
                
            }, label: {
                Text("Button")
            })
        }
        .frame(width: 360, height: 200, alignment: .center)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
