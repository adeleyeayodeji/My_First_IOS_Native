//
//  IconGrid.swift
//  Finance App
//
//  Created by Adeleye Ayodeji on 30/07/2023.
//

import SwiftUI

struct IconGrid: View {
    //grid layout
    @State var gridlayout = [GridItem(), GridItem(), GridItem()]
    //binding
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: gridlayout){
            ForEach(0..<5){ i in
                //if currency is already selected
                if Currency.allCases[i] == currency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                        )
                        .shadow(color: .black, radius: 9)
                        .onTapGesture {
                            print("tapped")
                            currency = Currency.allCases[i]
                        }
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            print("tapped not selcted")
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
        //add padding
        .padding([.bottom, .leading, .trailing])
    
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.silverPiece))
    }
}
