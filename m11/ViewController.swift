//
//  ViewController.swift
//  m11
//
//  Created by Maxim Nikolaev on 07.09.2021.
//

import UIKit

private class ViewController: UIViewController {
    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Int = 0
    var newValue: Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func makeOperation(mathOperation: MathOperation) {
        operation = mathOperation
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ConstantStrings.Calculator.title
    }
    
    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
        var digits = resultLabel.text
        digits?.append(digit)
        resultLabel.text = digits
    }
    
    func getInteger() -> Int {
        return Int(resultLabel.text ?? "0") ?? 0
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }

        if previousOperation != operation {
            newValue = getInteger()
        }
        if operation == .divide && newValue == 0 {
            resultLabel.text = "Error"
            isNewValue = true
        } else {
            result = operation.makeOperation(result: result, newValue: newValue)
            
            previousOperation = operation
            
            resultLabel.text = "\(result)"
            isNewValue = true
        }
    }
    
    @IBAction func onOne(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func onThree(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit("9")
    }
    @IBAction func onZero(_ sender: Any) {
        addDigit("0")
    }
    
    @IBAction func onMultiply(_ sender: Any) {
        makeOperation(mathOperation: .multiply)
    }
    @IBAction func onMinus(_ sender: Any) {
        makeOperation(mathOperation: .substract)
    }
    @IBAction func onPlus(_ sender: Any) {
        makeOperation(mathOperation: .sum)
    }
    @IBAction func onDivide(_ sender: Any) {
        makeOperation(mathOperation: .divide)
    }
    @IBAction func onEqual(_ sender: Any) {
        calculate()
    }
    @IBAction func onReset(_ sender: Any) {
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        resultLabel.text = "0"
    }
}



