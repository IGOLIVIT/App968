//
//  AddCryp.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI

struct AddCryp: View {
    
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
                            
                            viewModel.currentPhoto = ""
                            viewModel.crName = ""
                            viewModel.crName = ""
                            viewModel.crWell = ""
                            
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
                        
                        Menu(content: {
                            
                            ForEach(viewModel.curPhotos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                VStack {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(.white)
                                            .frame(width: 130, height: 130)
                                            .padding(1)
                                    }
                                    
                                    Text("Click on the icon to change")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                VStack {
                                    
                                    Image(viewModel.currentPhoto)
                                        .resizable()
                                        .frame(width: 130, height: 130)
                                        .padding(1)
                                    
                                    Text("Click on the icon to change")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 14, weight: .regular))
                                }
                            }
                        })
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.crName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.crName)
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("Well")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.crWell.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.crWell)
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("Dollar exchange rate")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.crEx.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.crEx)
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom, 25)
                        
                        Button(action: {
                            
                            viewModel.summa += Int(viewModel.crWell) ?? 0
                            viewModel.summa2 += Int(viewModel.crEx) ?? 0
                            viewModel.summa3 += Int(viewModel.crWell) ?? 0
                            
                            viewModel.summa2 += Int(viewModel.crEx) ?? 0
                            
                            viewModel.crPhoto = viewModel.currentPhoto
                            
                            viewModel.addCryp()
                            
                            viewModel.currentPhoto = ""
                            viewModel.crName = ""
                            viewModel.crName = ""
                            viewModel.crWell = ""
                            
                            viewModel.fetchCryps()
                            
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
                        .opacity(viewModel.currentPhoto.isEmpty || viewModel.crName.isEmpty || viewModel.crWell.isEmpty || viewModel.crEx.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.currentPhoto.isEmpty || viewModel.crName.isEmpty || viewModel.crWell.isEmpty || viewModel.crEx.isEmpty ? true : false)
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddCryp(viewModel: PlatformsViewModel())
}
