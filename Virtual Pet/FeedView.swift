//
//  FeedView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/4.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var petManager: PetManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { metric in
            VStack {
                Text("Select a Pet Food:")
                    .font(.title3)
                
                HStack {
                    Button(action: { removeHunger(value: 10) }) {
                        ImageWithLabel(imageName: "petFood1", width: metric.size.width*0.4, label: "+10 hunger")
                    }
                    
                    Button(action: { removeHunger(value: 15) })  {
                        ImageWithLabel(imageName: "petFood2", width: metric.size.width*0.4, label: "+15 hunger")
                    }
                }
                
                HStack {
                    Button(action: { removeHunger(value: 20) })  {
                        ImageWithLabel(imageName: "petFood3", width: metric.size.width*0.4, label: "+20 hunger")
                    }
                    
                    Button(action: { removeHunger(value: 5) })  {
                        ImageWithLabel(imageName: "petFood4", width: metric.size.width*0.4, label: "+5 hunger")
                            .padding(.top, 55)
                    }
                }
            }
            .position(x: metric.size.width / 2, y: metric.size.height / 2)
        }
    }
    
    func removeHunger(value: Int) {
        if petManager.hungerStatus + value > 100 {
            petManager.hungerStatus = 100
        } else {
            petManager.hungerStatus += value
        }
        self.mode.wrappedValue.dismiss()
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(petManager: PetManager())
    }
}

