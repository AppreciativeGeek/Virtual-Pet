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
    @Published var hungerStatus = 50
    @Published var energyStatus = 50
    @Published var joyStatus = 50
    
    init(petName: String = "", userName: String = "", petType: String = "dog") {
        self.petName = petName
        self.userName = userName
        self.petType = petType
    }
    
    func manageStatus() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if self.hungerStatus <= 100 && self.hungerStatus > 0 {
                self.hungerStatus -= 1
            }
            if self.energyStatus <= 100 && self.energyStatus > 0 {
                self.energyStatus -= 1
            }
            if self.joyStatus <= 100 && self.joyStatus > 0 {
                self.joyStatus -= 1
            }
        }
    }
}
