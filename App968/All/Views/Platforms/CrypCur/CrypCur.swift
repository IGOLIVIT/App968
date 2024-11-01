//
//  CrypCur.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI

struct CrypCur: View {

    @Environment(\.presentationMode) var back
    @StateObject var viewModel: PlatformsViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Cryptocurrency")
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
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCurr = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("green")))
                        })
                    }
                }
                .padding(.bottom, 25)
                
                if viewModel.cryptos.isEmpty {
                    
                    VStack {
                        
                        Text("Empty. Add cryptocurrency with button +")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 160)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.cryptos, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.crPhoto ?? "")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                    
                                    Text(index.crName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 6) {
                                        
                                        Text("$ \(index.crEx ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 11, weight: .regular))
                                        
                                        Text("\(index.crWell ?? "") \(index.crName ?? "")")
                                            .foregroundColor(Color("green"))
                                            .font(.system(size: 17, weight: .medium))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddCurr, content: {
            
            AddCryp(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchCryps()
        }
    }
}

#Preview {
    CrypCur(viewModel: PlatformsViewModel())
}
