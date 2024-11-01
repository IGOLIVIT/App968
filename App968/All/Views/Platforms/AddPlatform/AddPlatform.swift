//
//  AddPlatform.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI

struct AddPlatform: View {
    
    @Environment(\.presentationMode) var back
    @StateObject var viewModel: PlatformsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add cryptocurrency")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.plName = ""
                            viewModel.plLink = ""
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plName)
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("Link")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plLink.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plLink)
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("Cryptocurrency")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.cryptos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedCryp = index
                                
                            }, label: {
                                
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
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.selectedCryp == index ? Color("green") : .white))
                            })
                            
                        }
                        .padding(.bottom, 25)
                        
                        Button(action: {
                            
                            viewModel.plCC = viewModel.selectedCryp?.crName ?? ""
                            
                            viewModel.addPlatform()
                            
                            viewModel.plName = ""
                            viewModel.plLink = ""
                            
                            viewModel.fetchPlatforms()
                            
                            withAnimation(.spring()) {
                                
                                back.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("green")))
                        })
                        .opacity(viewModel.plName.isEmpty || viewModel.plLink.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.plName.isEmpty || viewModel.plLink.isEmpty ? true : false)
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCryps()
        }
    }
}

#Preview {
    AddPlatform(viewModel: PlatformsViewModel())
}
