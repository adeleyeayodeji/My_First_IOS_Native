//
//  SelectCurrency.swift
//  Finance App
//
//  Created by Adeleye Ayodeji on 27/07/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @State var gridlayout = [GridItem(), GridItem(), GridItem()]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            //Background
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack{
                //text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency Icon
                LazyVGrid(columns: gridlayout){
                    ForEach(0..<5){ _ in
                        CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny")
                    }
                }
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //done button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency()
    }
}
