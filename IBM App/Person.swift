//
//  Person.swift
//  IBM App
//
//  Created by jake on 12/03/2024.
//

import Foundation

enum Gender {
    case male
    case female
}

class Person {
    let weight: Double
    let height: Double
    let gender: Gender
    
    init(weight: Double, height: Double, gender: Gender) {
        self.weight = weight
        self.height = height
        self.gender = gender
    }
    
    func calculateBMI() -> Double {
        return weight / (height * height)
    }
    
    func getBMIStatus() -> BMIStatus {
        let bmi = calculateBMI()
        switch bmi {
        case ..<18.5:
            return .underweight
        case 18.5..<25:
            return .normal
        default:
            return .overweight
        }
    }
}
