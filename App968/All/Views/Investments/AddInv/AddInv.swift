//
//  AddInv.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI

struct AddInv: View {
    
    @Environment(\.presentationMode) var back
    @StateObject var viewModel: PlatformsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add Investment")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                            
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
                        
                        Text("Platform")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if viewModel.currentsPlatForAdd.isEmpty {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPlatForAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Select")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                            })
                            
                        } else {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPlatForAdd = true
                                }
                                
                            }, label: {
                                
                                Text(viewModel.currentsPlatForAdd)
                                    .foregroundColor(Color("green"))
                                    .font(.system(size: 17, weight: .medium))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            })
                        }
                        
                        Text("Date")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DatePicker("", selection: $viewModel.inDate, displayedComponents: .date)
                            .labelsHidden()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            ForEach(viewModel.invTypes, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentInvType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                })
                                .opacity(viewModel.currentInvType == index ? 1 : 0.5)
                            }
                        }
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.inType = viewModel.currentInvType
                            viewModel.inPlat = viewModel.currentsPlatForAdd
                            
                            viewModel.addInv()
                            
                            viewModel.currentsPlatForAdd = ""
                            viewModel.currentInvType = ""
                            
                            viewModel.fetchInvs()
                            
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
                        .opacity(viewModel.currentsPlatForAdd.isEmpty || viewModel.currentInvType.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentsPlatForAdd.isEmpty || viewModel.currentInvType.isEmpty ? true : false)
                    }
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isPlatForAdd, content: {
            
            PlatForAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    AddInv(viewModel: PlatformsViewModel())
}
