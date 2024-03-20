//
//  ViewController.swift
//  IBM App
//
//  Created by jake on 19/03/2024.
//

import UIKit

class ViewController: UIViewController {

    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter weight in kg"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter height in metrs"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        // Add UI elements to the view
        let headingLabel: UILabel = {
            let label = UILabel()
            label.text = "BMI Calculator"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 24)
            return label
        }()
        
        let topLabel: UILabel = {
            let label = UILabel()
            label.text = "Enter your information"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        let topLabel2: UILabel = {
            let label = UILabel()
            label.text = "hint: 1.32 meters 20 kg"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textColor = .systemRed
            return label
        }()

        
        let stackView = UIStackView(arrangedSubviews: [headingLabel, topLabel, topLabel2, weightTextField, heightTextField, genderSegmentedControl, calculateButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Adjust leading margin as needed
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // Adjust trailing margin as needed
            
            headingLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200), // Add top margin for headingLabel

            headingLabel.topAnchor.constraint(equalTo: view.topAnchor), // Add top margin for headingLabel

        ])
    }

    
    // Updated calculateBMI method as an instance method
    @objc func calculateBMI() {
        guard let weightText = weightTextField.text, let heightText = heightTextField.text, let weight = Double(weightText), let height = Double(heightText) else {
            showAlert(message: "Please enter valid weight and height.")
            return
        }
        
        let gender: Gender = genderSegmentedControl.selectedSegmentIndex == 0 ? .male : .female
        let person = Person(weight: weight, height: height, gender: gender)
        let bmi = person.calculateBMI()
        
        let resultViewController = ResultViewController()
        resultViewController.bmi = bmi
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
