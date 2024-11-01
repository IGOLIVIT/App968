//
//  PlatForAdd.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI

struct PlatForAdd: View {
    
    @Environment(\.presentationMode) var back
    @StateObject var viewModel: PlatformsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Platform")
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
                    
                    LazyVStack(spacing: 12) {
                        
                        ForEach(viewModel.platforms, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text(index.plName ?? "")
                                    .foregroundColor(Color("green"))
                                    .font(.system(size: 20, weight: .semibold))
                                
                                Text(index.plLink ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                ForEach(viewModel.cryptos.filter{($0.crName ?? "") == index.plCC ?? ""}) { indexer in
                                    
                                    HStack {
                                        
                                        Image(indexer.crPhoto ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                        
                                        Text(indexer.crName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                    }
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                }
                                
                                Button(action: {
                                    
                                    viewModel.selectedPlatform = index
                                    
                                    viewModel.currentsPlatForAdd = viewModel.selectedPlatform?.plName ?? ""
                                    
                                    back.wrappedValue.dismiss()
                                    
                                }, label: {
                                    
                                    Text("Choose")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 55)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlatforms()
        }
        .onAppear {
            
            viewModel.fetchCryps()
        }
    }
}

#Preview {
    PlatForAdd(viewModel: PlatformsViewModel())
}
