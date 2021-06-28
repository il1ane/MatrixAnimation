//
//  MatrixElement.swift
//  MatrixAnimation
//
//  Created by Iliane Zedadra on 26/06/2021.
//

import SwiftUI

struct MatrixElement: View {
    
    @ObservedObject var viewModel = MatrixElementViewModel()
    
    var body: some View {
        AnimationView(duration: .random(in: 1...3), viewModel: viewModel)
            .offset(viewModel.randomCG)
    }
}

struct MatrixElement_Previews: PreviewProvider {
    static var previews: some View {
        MatrixElement()
    }
}
