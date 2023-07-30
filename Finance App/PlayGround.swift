//
//  PlayGround.swift
//  Finance App
//
//  Created by Adeleye Ayodeji on 30/07/2023.
//

import SwiftUI

struct PlayGround: View {
    
    @State var placeHolderText = "This is the new text"
    
    var body: some View {
        VStack{
            Text("My Text: \(placeHolderText)")
            
            ContentButton2(placeHolderText: $placeHolderText)
            
            Button("Button 2"){
                placeHolderText = "From Parent"
            }
            
            ButtonContent3(placeHolderText: $placeHolderText)
        }
    }
}

struct ContentButton2: View {
    
    @Binding var placeHolderText: String
    
    var body: some View{
        Button("Button"){
            placeHolderText = "From binding"
        }
    }
    
}

struct ButtonContent3: View {
    @Binding var placeHolderText: String
    
    var body: some View{
        Button("Button 3"){
            placeHolderText = "From Third Binding"
        }
    }
}

struct PlayGround_Previews: PreviewProvider {
    static var previews: some View {
        PlayGround()
    }
}
