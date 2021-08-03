//
//  PetMainView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/3.
//
//  Commented code are undetermined parts

import SwiftUI

struct PetMainView: View {
    // let petManager: PetManager
    var body: some View {
        GeometryReader { metric in
            VStack {
                VStack {  // Top bar
                    StatusDisplay(iconSystemName: "fork.knife", statusValue: 12)
                }
                .frame(width: metric.size.width, height: metric.size.height*0.1)
                
                VStack {  // Main content
                    // Image(petManager.petType+"idle")
                }
                .frame(width: metric.size.width, height: metric.size.height*0.8)
                
                VStack {  // Bottom bar
                    
                }
                .frame(width: metric.size.width, height: metric.size.height*0.1)
            }
        }
    }
}

struct PetMainView_Previews: PreviewProvider {
    static var previews: some View {
        PetMainView()
    }
}
