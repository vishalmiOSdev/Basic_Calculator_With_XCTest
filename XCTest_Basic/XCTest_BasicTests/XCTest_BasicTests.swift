//
//  XCTest_BasicTests.swift
//  XCTest_BasicTests
//
//  Created by Vishal Manhas on 05/11/24.
//

import XCTest
@testable import XCTest_Basic


final class XCTest_BasicTests: XCTestCase {
    var mathOperation: MathOperation!

    override func setUpWithError() throws {

        mathOperation = MathOperation()
    }

    override func tearDownWithError() throws {
        mathOperation = nil
    }

    func testAdditionSuccess() throws {
        mathOperation.handleInput("7")
        mathOperation.handleInput("+")
        mathOperation.handleInput("3")
        mathOperation.handleInput("=")
        
        XCTAssertEqual(mathOperation.display, "7 + 3 = 10")
    }


    func testSubtraction() throws {
        // Test subtraction: 10 - 5 = 5
        mathOperation.handleInput("10")
        mathOperation.handleInput("-")
        mathOperation.handleInput("5")
        mathOperation.handleInput("=")
        
        XCTAssertEqual(mathOperation.display, "10 - 5 = 5")
    }

    func testMultiplication() throws {
        mathOperation.handleInput("4")
        mathOperation.handleInput("×")
        mathOperation.handleInput("5")
        mathOperation.handleInput("=")
        
        XCTAssertEqual(mathOperation.display, "4 × 5 = 20")
    }

    func testDivision() throws {
        mathOperation.handleInput("20")
        mathOperation.handleInput("÷")
        mathOperation.handleInput("4")
        mathOperation.handleInput("=")
        
        XCTAssertEqual(mathOperation.display, "20 ÷ 4 = 5")
    }


    func testSquareRoot() throws {
        // Test square root: √16 = 4
        mathOperation.handleInput("16")
        mathOperation.handleInput("√")
        
        XCTAssertEqual(mathOperation.display, "√(16) = 4")
    }


    func testClear() throws {
        mathOperation.handleInput("7")
        mathOperation.handleInput("+")
        mathOperation.handleInput("3")
        mathOperation.handleInput("C")
        
        XCTAssertEqual(mathOperation.display, "0")
    }


    func testPerformanceExample() throws {
       
        self.measure {
            mathOperation.handleInput("1000000")
            mathOperation.handleInput("+")
            mathOperation.handleInput("1000000")
            mathOperation.handleInput("=")
        }
    }
}
