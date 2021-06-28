//
//  ContentView.swift
//  MatrixAnimation
//
//  Created by Iliane Zedadra on 25/06/2021.
//

import SwiftUI

struct AnimationView: View {
    
    var duration:Int
    @State private var isAppearing = true
    @ObservedObject var viewModel: MatrixElementViewModel
    
    var body: some View {
        
        VStack {
            Spacer()
            
            if isAppearing {
                VStack(spacing: 0) {
                    ForEach(viewModel.randomCharacters, id: \.self) { character in
                        VStack {
                            Text(character)
                                .background(Color.green)
                                .opacity(.random(in: 0.2...0.7))
                                .foregroundColor(.green)
                                .font(.title)
                                .animation(.easeInOut)
                                .transition(.slide)
                        }
                    }
                    Spacer()
                }
                .animation(.easeInOut(duration: .random(in: 0...10)))
                
                .onAppear(perform: {
                    viewModel.generateRandomCharacters()
                })
                
                .onDisappear(perform: {
                    viewModel.randomCG = viewModel.cgRange
                })
                
                .onChange(of: viewModel.randomCharacters, perform: { value in
                    viewModel.generateRandomCharacters()
                    
                    if viewModel.randomCharacters.count > 20 {
                        withAnimation {
                            isAppearing = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(duration)) {
                                viewModel.randomCharacters.removeAll()
                                isAppearing = true
                            }
                        }
                    }
                })
            }
        }
    }
}


struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(duration: 1, viewModel: MatrixElementViewModel())
    }
}
