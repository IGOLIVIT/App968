//
//  PlatformsView.swift
//  App968
//
//  Created by IGOR on 26/10/2024.
//

import SwiftUI

struct PlatformsView: View {
    
    @StateObject var viewModel = PlatformsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Platforms")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isSettings = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 17, weight: .regular))
                            
                        })
                        
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCryptoCur = true
                            }
                            
                        }, label: {
                            
                            Image("kub")
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                        })
                        
                        Button(action: {
                            
                            viewModel.currentCryptoTypeForFilter = "All"
                            
                        }, label: {
                            
                            HStack {

                                Text("All")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                            }
                            .padding(9)
                            .padding(.horizontal, 5)
                            .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentCryptoTypeForFilter == "All" ? Color("green") : .white))
                        })
                        
                        ForEach(viewModel.cryptos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCryptoTypeForFilter = index.crName ?? ""
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(index.crPhoto ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25)
                                    
                                    Text(index.crName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                }
                                .padding(6)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentCryptoTypeForFilter == index.crName ?? "" ? Color("green") : .white))
                            })
                        }
                    }
                }
                
                if viewModel.cryptos.isEmpty {
                    
                    VStack(spacing: 8) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                        
                        Text("You don't have any currencies added yet")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 260)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCryptoCur = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    if viewModel.platforms.isEmpty {
                    
                    VStack(spacing: 8) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                        
                        Text("You don't have any platforms added yet")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 260)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlatform = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    if viewModel.currentCryptoTypeForFilter == "All" {
                        
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
                                        
                                        HStack {
                                            
                                            Button(action: {
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isCryptoCur = true
                                                }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil.tip")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 55)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                                        })
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedPlatform = index
                                                
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 55)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                                        })
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                }
                            }
                        }
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(spacing: 12) {
                                
                                ForEach(viewModel.platforms.filter{($0.plCC ?? "") == viewModel.currentCryptoTypeForFilter}, id: \.self) { index in
                                    
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
                                        
                                        HStack {
                                            
                                            Button(action: {
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isCryptoCur = true
                                                }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil.tip")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 55)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                                        })
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedPlatform = index
                                                
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 55)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                                        })
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                }
                            }
                        }
                    }
                    
                }
            }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddPlatform = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.black)
                        .font(.system(size: 17, weight: .semibold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                })
                .opacity(viewModel.platforms.isEmpty ? 0 : 1)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isCryptoCur, content: {
            
            CrypCur(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddPlatform, content: {
            
            AddPlatform(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchCryps()
        }
        .onAppear {
            
            viewModel.fetchPlatforms()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deletePlat(withPlName: viewModel.selectedPlatform?.plName ?? "", completion: {
                            
                            viewModel.fetchPlatforms()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PlatformsView()
}
