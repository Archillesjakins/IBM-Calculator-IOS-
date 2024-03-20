
//
//  ResultViewController.swift
//  IBM App
//
//  Created by jake on 12/03/2024.
//

import UIKit

class ResultViewController: UIViewController {

    var bmi: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Display BMI on the screen
        let bmiLabel = UILabel()
        bmiLabel.text = "BMI: \(String(format: "%.2f", bmi))"
        bmiLabel.textAlignment = .center
        bmiLabel.font = UIFont.systemFont(ofSize: 24)
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bmiLabel)
        
        NSLayoutConstraint.activate([
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bmiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Determine BMI status and display appropriate message
        let bmiStatus = getBMIStatus()
        let statusLabel = UILabel()
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.boldSystemFont(ofSize: 20)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 20),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        switch bmiStatus {
        case .underweight:
            statusLabel.text = "You are underweight."
            statusLabel.textColor = .red
        case .normal:
            statusLabel.text = "Your weight is normal."
            statusLabel.textColor = .green
        case .overweight:
            statusLabel.text = "You are overweight."
            statusLabel.textColor = .red
        }
    }
    
    private func getBMIStatus() -> BMIStatus {
        // Here, you can define the BMI status logic based on the calculated BMI value
        // This is just a placeholder implementation
        if bmi < 18.5 {
            return .underweight
        } else if bmi >= 18.5 && bmi < 25 {
            return .normal
        } else {
            return .overweight
        }
    }
}

