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
    @Published var petSprite = "idle" {
        didSet {
            if !["idle", "sad", "sleep", "eat", "play"].contains(petSprite) {
                self.petSprite = "idle"
            }
        }
    }
    @Published var hungerStatus = 50 {
        didSet {
            if self.hungerStatus > 100 {
                self.hungerStatus = 100
            }
            if self.hungerStatus < 0 {
                self.hungerStatus = 0
            }
            
            checkStatusSum()
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(hungerStatus) {
                UserDefaults.standard.set(encoded, forKey: "hungerStatus")
            }
        }
    }
    @Published var energyStatus = 50 {
        didSet {
            if self.energyStatus > 100 {
                self.energyStatus = 100
            }
            if self.energyStatus < 0 {
                self.energyStatus = 0
            }
            
            checkStatusSum()
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(energyStatus) {
                UserDefaults.standard.set(encoded, forKey: "energyStatus")
            }
        }
    }
    @Published var joyStatus = 50 {
        didSet {
            if self.joyStatus > 100 {
                self.joyStatus = 100
            }
            if self.joyStatus < 0 {
                self.joyStatus = 0
            }
            
            checkStatusSum()
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(joyStatus) {
                UserDefaults.standard.set(encoded, forKey: "joyStatus")
            }
        }
    }
    
    init(petName: String = "", userName: String = "", petType: String = "dog") {
        self.petName = petName
        self.userName = userName
        self.petType = petType
        
        if let petName = UserDefaults.standard.data(forKey: "petName") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: petName) {
                if decoded != "" {
                    self.petName = decoded
                }
            }
        }

        if let userName = UserDefaults.standard.data(forKey: "userName") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: userName) {
                if decoded != "" {
                    self.userName = decoded
                }
            }
        }
        
        if let petType = UserDefaults.standard.data(forKey: "petType") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: petType) {
                if decoded != "" {
                    self.petType = decoded
                }
            }
        }
        
        // petSprite not included since pet returns idle after owner's gone
        
        if let hungerStatus = UserDefaults.standard.data(forKey: "hungerStatus") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Int.self, from: hungerStatus) {
                self.hungerStatus = decoded
            }
        }
        
        if let energyStatus = UserDefaults.standard.data(forKey: "energyStatus") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Int.self, from: energyStatus) {
                self.energyStatus = decoded
            }
        }
        
        if let joyStatus = UserDefaults.standard.data(forKey: "joyStatus") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Int.self, from: joyStatus) {
                self.joyStatus = decoded
            }
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
    
    private func checkStatusSum() {
        if (self.hungerStatus + self.energyStatus + self.joyStatus) < 100 ||
            self.hungerStatus < 10 ||
            self.energyStatus < 10 ||
            self.joyStatus < 10
        {
            self.petSprite = "sad"
        }
    }
}
