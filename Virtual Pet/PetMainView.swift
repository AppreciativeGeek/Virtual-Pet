//
//  PetMainView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/3.
//
//  Commented code are undetermined parts

import SwiftUI

struct PetMainView: View {
    let petInformation : PetInformation
    // let petManager: PetManager
    var body: some View {
        GeometryReader { metric in
            VStack {
                VStack {  // Top bar
                    StatusDisplay(iconImageName: "fork.knife.circle", statusValue: 12)
                    
                    StatusDisplay(iconSystemName: "zzz", statusValue: 80)
                }
                .padding()
                .frame(width: metric.size.width, height: metric.size.height*0.1, alignment: .leading)
                Spacer()
                VStack {  // Main content
                    // Image(petManager.petType+"-idle")
                    ScaledImage(imageName: "dog"+"-idle", width: metric.size.width*0.4)
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
    }
}

struct PetMainView_Previews: PreviewProvider {
    static var previews: some View {
        PetMainView(petInformation: PetInformation())
    }
}
