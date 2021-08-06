//
//  LoginView.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var petManager = PetManager()
    
    var body: some View {
        VStack {
            Text("What is your name?")
            
            CustomTextField(placeholder: "Your name", variable: $petManager.userName)
                .padding()
            
            Text("What would you like your pet's name to be?")
            
            CustomTextField(placeholder: "Your pet's name", variable: $petManager.petName)
                .padding()
            
            Text("What kind of pet would you like to have?")
            
            Picker("", selection: $petManager.petType) {
                Text("Dog").tag("dog")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            NavigationLink("Proceed", destination: PetMainView(petManager: petManager))
        }
        .frame(width: 360, height: 200, alignment: .center)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
            LoginView()
        }
    }
}
