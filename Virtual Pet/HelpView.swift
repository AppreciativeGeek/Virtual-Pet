//
//  HelpView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/6.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Help")
                    .font(.title)
                    .bold()
                
                HStack {
                    VStack(alignment: .leading) {
                        StatusDisplay(iconImageName: "fork.knife.circle", substituteText: "Food")
                        
                        HelpText(text: "When you feed your pet, this stat will increase. When your pet sleeps or plays with toys, this will decrease.")
                        
                        StatusDisplay(iconSystemName: "zzz", substituteText: "Energy")
                        
                        HelpText(text: "Your pet restores energy by having some rest, and loses it after playing.")
                        
                        StatusDisplay(iconSystemName: "smiley", substituteText: "Happiness")
                        
                        HelpText(text: "Your pet gets happier by playing, and feels worse after some sleep.")
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
            }
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Back") {
                        self.mode.wrappedValue.dismiss()
                    }
                }
            }
        }
        
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

struct HelpText: View {
    let text: String
    var body: some View {
        Text(text)
            .padding(.bottom)
            .padding(.leading)
            .padding(.trailing)
    }
}
