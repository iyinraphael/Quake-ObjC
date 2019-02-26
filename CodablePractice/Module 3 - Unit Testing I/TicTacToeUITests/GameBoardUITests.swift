//
//  GameBoardUITests.swift
//  TicTacToeUITests
//
//  Created by Iyin Raphael on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class GameBoardUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVerticalWin0() {
        
     GamePage(testCase: self)
        .tapSquare(0)
        .tapSquare(1)
        .tapSquare(3)
        .tapSquare(4)
        .tapSquare(6)
        .verifyPlayerWin(player: .x, file: #file, line: #line)
    }

    func testExample() {
        
        
        let app = XCUIApplication()
        app.buttons["X"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).children(matching: .button).matching(identifier: " ").element(boundBy: 0).tap()
        
        let button = element.children(matching: .other).element(boundBy: 1).children(matching: .button).matching(identifier: " ").element(boundBy: 0)
        button.tap()
        button.tap()
        element.children(matching: .other).element(boundBy: 2).children(matching: .button).matching(identifier: " ").element(boundBy: 0).tap()
        
        let label = XCUIApplication().staticTexts["GameViewController.StatusLabel"]
        
        XCTAssertEqual(label.label, "Player X won!")
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
