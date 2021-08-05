//
//  PlayView.swift
//  Virtual Pet
//
//  Created by Bruno Garcia on 8/4/21.
//

import SwiftUI


struct PlayView: View {
    @ObservedObject var petManager: PetManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { metric in
            VStack {
                Text("Select a Pet Toy:")
                    .font(.title2)
                
                HStack {
                    Button(action: { addJoy(value: 10) }) {
                        ImageWithLabel(imageName: "dogToy", width: metric.size.width*0.4, label: "+10 joy")
                    }
                    
                    Button(action: { addJoy(value: 15) })  {
                        ImageWithLabel(imageName: "dogToy2", width: metric.size.width*0.4, label: "+15 joy")
                    }
                }
            }
            .position(x: metric.size.width / 2, y: metric.size.height / 2)
        }
    }
    
    func addJoy(value: Int) {
        petManager.joyStatus += value
        self.mode.wrappedValue.dismiss()
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(petManager: PetManager())
    }
}

