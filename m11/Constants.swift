//
//  Constants.swift
//  m11
//
//  Created by Maxim Nikolaev on 07.09.2021.
//

import Foundation

enum ConstantStrings {
    enum Calculator {
        static let title = "Calculator"
    }
}

enum MathOperation {
    case sum, substract, divide, multiply
    
    func makeOperation(result: Int, newValue: Int) -> Int {
        switch self {
        case .sum:
            return (result + newValue)
        case .substract:
            return (result - newValue)
        case .divide:
            if newValue != 0 {
                return (result / newValue)
            } else {return 0}
        case .multiply:
            return (result * newValue)
        }
        
    }
}
