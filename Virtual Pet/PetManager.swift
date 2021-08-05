//
//  PetManager.swift
//  Virtual Pet
//
//  Created by James on 8/3/21.
//

import Foundation

class PetManager : ObservableObject {
    // Default values for per-page canvas
    @Published var petName: String {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(petName) {
                UserDefaults.standard.set(encoded, forKey: "petName")
            }
        }
    }
    @Published var userName: String {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(userName) {
                UserDefaults.standard.set(encoded, forKey: "userName")
            }
        }
    }
    @Published var petType: String {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(petType) {
                UserDefaults.standard.set(encoded, forKey: "petType")
            }
        }
    }
    @Published var hungerStatus = 50
    @Published var energyStatus = 50
    @Published var joyStatus = 50
    
    init(petName: String = "", userName: String = "", petType: String = "dog") {
        self.petName = ""
        self.userName = ""
        self.petType = ""
        
        if let petName = UserDefaults.standard.data(forKey: "petName") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: petName) {
                self.petName = decoded
            }
        } else {
            self.petName = petName
        }

        if let userName = UserDefaults.standard.data(forKey: "userName") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: userName) {
                self.userName = decoded
            }
        } else {
            self.userName = userName
        }
        
        if let petType = UserDefaults.standard.data(forKey: "petType") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: petType) {
                self.petType = decoded
            }
        } else {
            self.petType = petType
        }
    }
    
    public func manageStatus() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if (self.hungerStatus <= 100) && (self.hungerStatus > 0) {
                self.hungerStatus -= 1
            }
            if (self.energyStatus <= 100) && (self.energyStatus > 0) {
                self.energyStatus -= 1
            }
            if (self.joyStatus <= 100) && (self.joyStatus > 0) {
                self.joyStatus -= 1
            }
        }
    }
}
