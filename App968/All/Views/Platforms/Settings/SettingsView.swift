//
//  SettingsView.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {

    @Environment(\.presentationMode) var back
    @StateObject var viewModel: PlatformsViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Currency")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        VStack {
                            
                            Image("Dollar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                            
                            Text("Dollar")
                                .foregroundColor(.black)
                                .font(.system(size: 32, weight: .bold))
                            
                            Text("\(viewModel.DollarExchange) $")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 36, weight: .bold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDollar = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil.tip")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                        .padding(.bottom)
                        
                        Button(action: {
  
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate App")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 20, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/8a032626-9ec2-40c5-b93c-3c50e9ea04d4") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 20, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })

                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDollar ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDollar = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDollar = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Dollar exchange rate")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                    
                    ZStack(content: {
                        
                        Text("123")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addExchange.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addExchange)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {

                            viewModel.DollarExchange = viewModel.addExchange

                            viewModel.addExchange = ""

                            withAnimation(.spring()) {
                                
                                viewModel.isDollar = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.addExchange = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDollar = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top, 25)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.9)))
                .padding()
                .offset(y: viewModel.isDollar ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView(viewModel: PlatformsViewModel())
}
