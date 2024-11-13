//
//  ContentView.swift
//  XCTest_Basic
//
//  Created by Vishal Manhas on 05/11/24.
//

import SwiftUI

struct CalView: View {
    @StateObject private var mathOperation = MathOperation()
    
    let buttons = [
        ["7", "8", "9", "÷", "√"],
        ["4", "5", "6", "×", "%"],
        ["1", "2", "3", "-", "."],
        ["0", "C", "=", "+", "±"]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text(mathOperation.display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            mathOperation.handleInput(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 60, height: 60)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
    }
}


#Preview {
    CalView()
}

