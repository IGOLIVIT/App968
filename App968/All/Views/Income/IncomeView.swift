//
//  IncomeView.swift
//  App968
//
//  Created by IGOR on 26/10/2024.
//

import SwiftUI

struct IncomeView: View {

    @StateObject var viewModel = PlatformsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Investments")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                .padding(.bottom, 25)
                
                VStack(spacing: 15) {
                    
                    Image("koksh")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("\(viewModel.summa) $")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Image("gp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            
                            Text("BANCOR")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 22, weight: .semibold))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 12) {
                                
                                Text("$ \(viewModel.summa3)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Text("Sum")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(spacing: 15) {
                        
                        Image("gm")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            
                            Text("COMPOUND")
                                .foregroundColor(Color("red"))
                                .font(.system(size: 22, weight: .semibold))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 12) {
                                
                                Text("$ \(viewModel.summa2)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Text("Sum")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
            }
            .padding()
        }
    }
}

#Preview {
    IncomeView()
}
