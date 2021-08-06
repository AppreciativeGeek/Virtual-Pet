//
//  Virtual_PetApp.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import SwiftUI

@main
struct Virtual_PetApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if let petName = UserDefaults.standard.data(forKey: "petName") {
                    PetMainView(petManager: PetManager())
                } else {
                    LoginView()
                }
            }
        }
    }
}
