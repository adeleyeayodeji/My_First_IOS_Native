//
//  ContentView.swift
//  Finance App
//
//  Created by Adeleye Ayodeji on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectedCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack{
            //Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                //Prancing pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //Currency exchange text
                Text("Currency exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                //Currency conversion section
                HStack{
                    //Left conversion section
                    VStack{
                        //Currency
                        
                        HStack{
                            //Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            // Display currency selection screen
                            showSelectedCurrency.toggle() // Toggle the state of the variable
                        }
                        .sheet(isPresented: $showSelectedCurrency) {
                            // Display currency selection screen
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //Text field
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.center)
                    }
                    //Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    //Right consersion section
                    VStack{
                        //Currency
                        
                        HStack{
                            //Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            //Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            // Display currency selection screen
                            showSelectedCurrency.toggle() // Toggle the state of the variable
                        }
                        .sheet(isPresented: $showSelectedCurrency) {
                            // Display currency selection screen
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //Text field
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(20)
                
                Spacer()
                
                //Info Button
                HStack {
                    Spacer()
                    
                    Button {
                        // Display exchange info screen
                        showExchangeInfo.toggle() //toggle exchange info
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        //show exchange info page
                        ExchangeInfo();
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
