//
//  PetMainView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/3.
//
//  Commented code are undetermined parts

import SwiftUI

struct PetMainView: View {
    @State private var firstAppear = true
    @State private var showHelp = false
    @ObservedObject var petManager: PetManager
    var body: some View {
        GeometryReader { metric in
            VStack {
                Text("Welcome \(petManager.userName)!")
                    .padding()
                
                VStack {  // Top bar
                    StatusDisplay(iconImageName: "fork.knife.circle", statusValue: petManager.hungerStatus)
                    StatusDisplay(iconSystemName: "zzz", statusValue: petManager.energyStatus)
                    StatusDisplay(iconSystemName: "smiley", statusValue: petManager.joyStatus)
                }
                .padding(.top)
                .padding()
                .frame(width: metric.size.width, height: metric.size.height*0.1, alignment: .leading)
                
                VStack {  // Main content
                    Text("\(petManager.petName)")
                    FittedImage(imageName: "\(petManager.petType)"+"-idle", width: metric.size.width*0.8)
                }
                .frame(width: metric.size.width, height: metric.size.height*0.8)
                
                HStack {  // Bottom bar
                    NavigationLink(destination: FeedView(petManager: petManager)) {
                        ScaledImage(imageName: "petFood", width: metric.size.width*0.25)
                    }
                    .padding(.trailing)
                    
                    NavigationLink(destination: PlayView(petManager: petManager)) {
                        ScaledImage(imageName: "ball", width: metric.size.width*0.25)
                            .padding(.trailing)
                    }
                    
                    NavigationLink(destination: SleepView(petManager: petManager)) {
                        ScaledImage(imageName: "petBed", width: metric.size.width*0.25)
                    }
                }
                .frame(width: metric.size.width, height: metric.size.height*0.1)
            }
        }
        .offset(x: 0, y: -80.0)
        .onAppear(perform: {
            if firstAppear == true {
                petManager.manageStatus()
                firstAppear = false
            }
        })
        .navigationBarBackButtonHidden(true)
        .toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showHelp = true }, label: {
                    Image(systemName: "questionmark.circle")
                })
            }
        }
        .sheet(isPresented: $showHelp, content: {
            HelpView()
        })
    }
}

struct PetMainView_Previews: PreviewProvider {
    static var previews: some View {
        PetMainView(petManager: PetManager())
    }
}
