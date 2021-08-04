//
//  SleepView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/5.
//

import SwiftUI

struct SleepView: View {
    @ObservedObject var petManager: PetManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView(petManager: PetManager())
    }
}
