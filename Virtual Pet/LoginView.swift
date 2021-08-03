//
//  LoginView.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import SwiftUI

struct PetInformation {
    var userName = String()
    var petName = String()
    var petType = String()
}

struct LoginView: View {
    @State private var petInformation = PetInformation()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("What is your name?")
                CustomTextField(placeholder: "Your name", variable: $petInformation.userName)
                    .padding()
                Text("What would you like your pet's name to be?")
                CustomTextField(placeholder: "Your pet's name", variable: $petInformation.petName)
                    .padding()
                Text("What kind of pet would you like to have?")
                Picker("", selection: $petInformation.petType) {
                    Text("Dog").tag("dog")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                NavigationLink("Proceed", destination: PetMainView(petInformation: petInformation))
            }
            .frame(width: 360, height: 200, alignment: .center)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
