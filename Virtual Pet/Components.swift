//
//  Components.swift
//  Virtual Pet
//
//  Created by James on 8/2/21.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .multilineTextAlignment(.center)
    }
}

struct StatusDisplay: View {
    var iconSystemName = ""
    var iconImageName = ""
    let statusValue: Int
    
    var body: some View {
        HStack {
            Group {
                if iconSystemName != "" {
                    Image(systemName: iconSystemName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(iconImageName)
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(width: 30, height: 30)
            
            Text("\(statusValue)/100")
        }
    }
}

struct ScaledImage: View {  // This will basically make the image really big
    let imageName: String
    let width: CGFloat
    var body: some View {
        VStack {
            Group {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: width)
        }
    }
}

struct FittedImage: View {  // This will shrink the image to scale, if needed
    let imageName: String
    let width: CGFloat
    var body: some View {
        VStack {
            Group {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: width)
        }
    }
}

struct ImageWithLabel: View {
    let imageName: String
    let width: CGFloat
    let label: String
    var body: some View {
        VStack {
            FittedImage(imageName: imageName, width: width)
            
            Text(label)
        }
    }
}
