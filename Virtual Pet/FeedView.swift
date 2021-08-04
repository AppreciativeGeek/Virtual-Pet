//
//  FeedView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/4.
//

import SwiftUI

struct FeedView: View {
    let petManager: PetManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { metric in
            VStack {
                HStack {
                    FittedImage(imageName: "petFood1", width: metric.size.width*0.4)
                    
                    FittedImage(imageName: "petFood2", width: metric.size.width*0.4)
                }
                
                HStack {
                    FittedImage(imageName: "petFood3", width: metric.size.width*0.4)
                    
                    FittedImage(imageName: "petFood4", width: metric.size.width*0.4)
                }
            }
            .position(x: metric.size.width / 2, y: metric.size.height / 2)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(petManager: PetManager())
    }
}
