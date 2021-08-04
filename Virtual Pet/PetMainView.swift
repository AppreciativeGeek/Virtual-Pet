//
//  PetMainView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/3.
//
//  Commented code are undetermined parts

import SwiftUI

struct PetMainView: View {
    let petManager: PetManager
    var body: some View {
        GeometryReader { metric in
            VStack {
                Text("Welcome \(petManager.userName)!")
                    .padding()
                VStack {  // Top bar
                    StatusDisplay(iconImageName: "fork.knife.circle", statusValue: 12)
                    
                    StatusDisplay(iconSystemName: "zzz", statusValue: 80)
                }
                .padding()
                .frame(width: metric.size.width, height: metric.size.height*0.1, alignment: .leading)
                Spacer()
                VStack {  // Main content
                    Text("\(petManager.petName)")
                    // Image(petManager.petType+"-idle")
                    ScaledImage(imageName: "\(petManager.petType)"+"-idle", width: metric.size.width*0.4)
                }
                .frame(width: metric.size.width, height: metric.size.height*0.4)
                Spacer()
                HStack {  // Bottom bar
                    ScaledImage(imageName: "petFood", width: metric.size.width*0.25)
                        .padding(.trailing)
                    
                    ScaledImage(imageName: "ball", width: metric.size.width*0.25)
                        .padding(.trailing)
                    
                    ScaledImage(imageName: "petBed", width: metric.size.width*0.25)
                }
                .frame(width: metric.size.width, height: metric.size.height*0.1)
            }
        }
        .offset(x: 0, y: -60.0)
    }
}

struct PetMainView_Previews: PreviewProvider {
    static var previews: some View {
        PetMainView(petManager: PetManager(petName: "", userName: "", petType: ""))
    }
}
