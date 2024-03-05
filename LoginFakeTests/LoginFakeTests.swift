//
//  LoginFakeTests.swift
//  LoginFakeTests
//
//  Created by Tony Lieu on 3/4/24.
//

import XCTest
@testable import LoginFake

final class LoginFakeTests: XCTestCase {
    
       var loginView: DummyLoginView!

       override func setUpWithError() throws {
           loginView = DummyLoginView()
           // Load the view hierarchy
           _ = loginView.view
       }

       override func tearDownWithError() throws {
           loginView = nil
       }

       func testLoginSuccess() throws {
           // Set up test data
           loginView.userName.text = "testUser@gmail.com"
           loginView.password.text = "Password"
           
           // Trigger login button tap
           loginView.loginButtonTapped()
           
           // Assert that the validation passes
           XCTAssertTrue(loginView.valildationVM.loginVal(emailID: loginView.userName.text, passwordinput: loginView.password.text))
       }

       func testLoginFailure() throws {
           // Set up test data
           loginView.userName.text = "invalidUser"
           loginView.password.text = "invalidPassword"
           
           // Trigger login button tap
           loginView.loginButtonTapped()
           
           // Assert that the validation fails
           XCTAssertFalse(loginView.valildationVM.loginVal(emailID: "invalidUser", passwordinput: "invalidPassword"))
       }
}
