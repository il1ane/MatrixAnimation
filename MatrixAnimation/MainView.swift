//
//  MainView.swift
//  MatrixAnimation
//
//  Created by Iliane Zedadra on 25/06/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack {
                Group {
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                    MatrixElement()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
