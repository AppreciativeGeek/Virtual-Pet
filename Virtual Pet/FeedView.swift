//
//  FeedView.swift
//  Virtual Pet
//
//  Created by Xia He on 2021/8/4.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { metric in
            VStack {
                HStack {
                    ScaledImage(imageName: "petFood1", width: metric.size.width*0.4)
                    
                    ScaledImage(imageName: "petFood2", width: metric.size.width*0.4)
                }
                
                HStack {
                    ScaledImage(imageName: "petFood3", width: metric.size.width*0.4)
                    
                    ScaledImage(imageName: "petFood4", width: metric.size.width*0.4)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
