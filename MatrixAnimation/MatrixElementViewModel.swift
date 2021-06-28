//
//  MatrixElementViewModel.swift
//  MatrixAnimation
//
//  Created by Iliane Zedadra on 26/06/2021.
//

import Foundation
import SwiftUI

final class MatrixElementViewModel: ObservableObject {
    
    @Published var randomCG = CGSize()
    @Published var randomCharacters = [String]()
    
    let cgRange = CGSize(width: .random(in: -400...400), height: .random(in: -400...400))
    let characters = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "ア","カ","サ","タ","ナ","ハ","マ","ヤ","ラ","ワ","ガ","ザ","ダ","バ","パ"]
    
    init() {
        randomCG = cgRange
    }
    
    func generateRandomCharacters() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 / 7) {
            self.randomCharacters.append(self.characters.randomElement()!)
            
        }
    }
    
}
