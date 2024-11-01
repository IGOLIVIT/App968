//
//  LoadingView.swift
//  App968
//
//  Created by IGOR on 26/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Logotip")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("RexDef")
                        .foregroundColor(.black)
                        .font(.system(size: 64, weight: .black))
                        .padding(.top, 400)
                    
                }
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
