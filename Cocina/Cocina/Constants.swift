//
//  Constants.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/17/24.
//

import Foundation

enum Constants {
    enum Core {}
    enum Onboarding {
        static let enterFirstNameHeader = String(localized: "First name", comment: "The header for entering a first name")
        static let enterFirstPlaceholder = String(localized: "Enter your first name", comment: "The placeholder for entering a first name")
        static let enterLastNameHeader = String(localized: "Last name", comment: "The header for entering a last name")
        static let enterLastPlaceholder = String(localized: "Enter your last name", comment: "The placeholder for entering a last name")
        static let enterEmailHeader = String(localized: "Email", comment: "The header for entering an email address")
        static let enterEmailPlaceholder = String(localized: "Enter an email address", comment: "The placeholder for entering an email address")
        static let enterPasswordHeader = String(localized: "Password", comment: "The header for entering a password")
        static let enterPasswordPlaceholder = String(localized: "Enter a password...", comment: "The placeholder for entering a password")
    }
    enum Home {}
    enum Explore {}
    enum Search {}
    enum Plan {}
    enum Groceries {}
    enum Chef {}
    enum Settings {}
}
