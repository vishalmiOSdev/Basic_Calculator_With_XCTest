//
//  MathOperations.swift
//  XCTest_Basic
//
//  Created by Vishal Manhas on 06/11/24.
//
import Foundation

import Foundation

import Foundation

class MathOperation: ObservableObject {
    @Published var display: String = "0"
    private var fullEquation: String = ""
    private var currentInput: String = ""
    private var currentOperation: String? = nil
    private var result: Double?
    
    func handleInput(_ input: String) {
        switch input {
        case "0"..."9", ".":
            currentInput += input
            updateDisplay()
            
        case "+", "-", "×", "÷":
            if let value = Double(currentInput) {
                if result == nil {
                    result = value
                } else {
                    calculateResult() // For chain operations
                }
                currentOperation = input
                fullEquation += "\(currentInput) \(input) "
                currentInput = ""
                updateDisplay()
            }
        
        case "=":
            if let value = Double(currentInput) {
                fullEquation += "\(currentInput)"
                result = result == nil ? value : calculateResult()
                currentOperation = nil
                display = "\(fullEquation) = \(formatResult(result ?? 0))"
                fullEquation = "" // Clear for next operation
                result = nil
                currentInput = ""
            }
            
        case "C":
            clear()
            
        case "√":
            if let value = Double(currentInput), value >= 0 {
                result = sqrt(value)
                display = "√(\(currentInput)) = \(formatResult(result ?? 0))"
                fullEquation = ""
                currentInput = ""
            } else {
                display = "√(\(currentInput)) = NaN"
            }
        
        case "%":
            if let value = Double(currentInput) {
                result = value / 100
                display = "\(currentInput)% = \(formatResult(result ?? 0))"
                fullEquation = ""
                currentInput = ""
            }
            
        case "±":
            if let value = Double(currentInput) {
                currentInput = String(-value)
                updateDisplay()
            }
            
        default:
            break
        }
    }

    private func updateDisplay() {
        display = fullEquation + currentInput
    }

    private func calculateResult() -> Double {
        guard let operation = currentOperation, let currentValue = result, let inputValue = Double(currentInput) else {
            return result ?? 0
        }

        switch operation {
        case "+":
            result = currentValue + inputValue
        case "-":
            result = currentValue - inputValue
        case "×":
            result = currentValue * inputValue
        case "÷":
            if inputValue == 0 {
                display = "\(currentValue) ÷ 0 = Infinity"
                result = nil
                currentInput = ""
                fullEquation = ""
                return 0
            }
            result = currentValue / inputValue
        default:
            break
        }

        return result ?? 0
    }

    private func clear() {
        fullEquation = ""
        currentInput = ""
        currentOperation = nil
        result = nil
        display = "0"
    }

    private func formatResult(_ value: Double) -> String {
        return value == floor(value) ? String(Int(value)) : String(value)
    }
}
