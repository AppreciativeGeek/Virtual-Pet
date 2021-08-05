//
//  SleepView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/5.
//

import SwiftUI

struct SleepView: View {
    @State private var hours = 0
    @ObservedObject var petManager: PetManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Sleep for How Many Hours?")
                .font(.title3)
            
            Picker("", selection: $hours) {
                ForEach(0...10, id: \.self) {i in
                    Text("\(i)").tag(i)
                }
            }
            .padding(.top, -60)
            
            Button("Let \(petManager.petName) Go to Sleep", action: {
                petManager.energyStatus += hours*10
                petManager.joyStatus -= hours
                petManager.hungerStatus -= hours*5
                self.mode.wrappedValue.dismiss()
            })
            .disabled(hours==0)
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView(petManager: PetManager())
    }
}
