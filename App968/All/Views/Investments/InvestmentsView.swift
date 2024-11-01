//
//  InvestmentsView.swift
//  App968
//
//  Created by IGOR on 26/10/2024.
//

import SwiftUI

struct InvestmentsView: View {
    
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
                
                HStack {
                    
                    ForEach(viewModel.invTypes, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentInvTypeForFilter = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                        .opacity(viewModel.currentInvTypeForFilter == index ? 1 : 0.5)
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
                    
                    if viewModel.investments.isEmpty {
                        
                        VStack(spacing: 8) {
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("You don't have any investment added yet")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .multilineTextAlignment(.center)
                                .frame(width: 260)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddInvestments = true
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
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(spacing: 12) {
                                
                                ForEach(viewModel.investments.filter{($0.inType ?? "") == viewModel.currentInvTypeForFilter}, id: \.self) { bindex in
                                    
                                    ForEach(viewModel.platforms.filter{($0.plName ?? "") == bindex.inPlat ?? ""}, id: \.self) { index in
                                        
                                        ForEach(viewModel.cryptos.filter{($0.crName ?? "") == index.plCC ?? ""}) { indexer in
                                            
                                            VStack(alignment: .leading, spacing: 12) {
                                                
                                                HStack {
                                                    
                                                    VStack(alignment: .leading, spacing: 12) {
                                                        
                                                        Text(index.plName ?? "")
                                                            .foregroundColor(Color("green"))
                                                            .font(.system(size: 20, weight: .semibold))
                                                        
                                                        Text("\((bindex.inDate ?? Date()).convertDate(format: "MMM dd, yyyy"))")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 14, weight: .regular))
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .trailing, spacing: 12) {
                                                        
                                                        Text("$ \(indexer.crEx ?? "")")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 20, weight: .medium))
                                                        
                                                        Text("Sum")
                                                            .foregroundColor(.gray)
                                                            .font(.system(size: 13, weight: .regular))
                                                    }
                                                }
                                                
                                                HStack {
                                                    
                                                    Image(indexer.crPhoto ?? "")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 25)
                                                    
                                                    Text(indexer.crName ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .trailing, spacing: 6) {
                                                        
                                                        Text("$ \(indexer.crEx ?? "")")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 11, weight: .regular))
                                                        
                                                        Text("\(indexer.crWell ?? "")")
                                                            .foregroundColor(Color("green"))
                                                            .font(.system(size: 17, weight: .medium))
                                                    }
                                                }
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                                
                                                
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
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddInvestments = true
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
        .sheet(isPresented: $viewModel.isAddInvestments, content: {
            
            AddInv(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchCryps()
        }
        .onAppear {
            
            viewModel.fetchPlatforms()
        }
        .onAppear {
            
            viewModel.fetchInvs()
        }
        .sheet(isPresented: $viewModel.isCryptoCur, content: {
            
            CrypCur(viewModel: viewModel)
        })
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
                        
                        CoreDataStack.shared.deleteInv(withInName: viewModel.selectedInv?.inPlat ?? "", completion: {
                            
                            viewModel.fetchInvs()
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
    InvestmentsView()
}
