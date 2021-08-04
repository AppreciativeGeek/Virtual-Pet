//
//  PetManager.swift
//  Virtual Pet
//
//  Created by James on 8/3/21.
//

import Foundation

class PetManager : ObservableObject {
    // Default values for per-page canvas
    @Published var petName: String
    @Published var userName: String
    @Published var petType: String
    
    init(petName: String = "", userName: String = "", petType: String = "dog") {
        self.petName = petName
        self.userName = userName
        self.petType = petType
    }
}
