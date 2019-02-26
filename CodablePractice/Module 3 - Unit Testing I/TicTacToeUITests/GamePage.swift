//
//  GamePage.swift
//  TicTacToeUITests
//
//  Created by Iyin Raphael on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct GamePage: TestPage {
    
    //UI elements
    
    var turnLabel: XCUIElement {
        
        return app.staticTexts["GameViewController.StatusLabel"]
    }
    
    var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    /// This function returns a button for a given index in the game board
    /// - Requires: The value of index should be from 0 to 8
    
    //discardabelResult means don't yell when i Dont make the method a cosntant
    @discardableResult func button(_ index: Int) -> XCUIElement {
        return app.buttons["GameViewController.Button\(index)"]
    }
    
    
    //(Inter)Actions
        //tap on a square
    @discardableResult func tapSquare(_ index: Int) -> GamePage {
        button(index).tap()
        return self
    }
    
        //Restart the game
    @discardableResult func restartGame() -> GamePage {
        restartButton.tap()
        return self
    }
    
    //Verification
    
    @discardableResult func verifyPlayerWin(player: Mark, file: String, line: UInt) -> GamePage {
        testCase.expect(turnLabel.label, equals: "Player \(player.stringValue) won!", file: file, line: line)
        return self 
    }
    
    
    enum Mark: Equatable {
        case x
        case o
        
        var stringValue: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            }
        }
    }
    
    var testCase: XCTestCase
}
