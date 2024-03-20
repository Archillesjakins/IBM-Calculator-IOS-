//
//  BMIStatus.swift
//  IBM App
//
//  Created by jake on 12/03/2024.
//

import Foundation

enum BMIStatus {
    case underweight
    case normal
    case overweight
    
    var description: String {
        switch self {
        case .underweight:
            return "Underweight"
        case .normal:
            return "Normal"
        case .overweight:
            return "Overweight"
        }
    }
}
