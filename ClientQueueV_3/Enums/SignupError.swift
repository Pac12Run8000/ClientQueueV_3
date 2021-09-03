//
//  SignupError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/31/21.
//

import Foundation


enum SignupError:Error {
    case no_first_name
    case no_last_name
    case only_alphanumeric_chars
    case no_street_address
    case no_city_state
    case no_zip_code
    case zip_code_is_too_short
    case no_phone_number
    case need_13_characters
    case is_phone_number_formatted
    case no_emailaddress
    case invalid_email_formatting
    case no_username
    case only_alpha_numeric_chars_username
    case username_must_have_4_chars
    case username_must_have_lessthan_15
    case no_password
    case password_must_have_4_characters
    case password_must_have_capital_letter
    case password_must_be_alpha_numeric
    // ****
    
    
}


extension SignupError:CustomStringConvertible {
    var description: String {
        switch self {
        case .no_first_name:
            return "Enter a first name"
        case .no_last_name:
            return "Enter a last name"
        case .only_alphanumeric_chars:
            return "Enter only alpha-numeric characters."
        case .no_street_address:
            return "Enter a street address."
        case .no_city_state:
            return "Enter a city and state"
        case .no_zip_code:
            return "Enter a zip code"
        case .zip_code_is_too_short:
            return "Enter a valid zip code that is 5 characters long."
        case .no_phone_number:
            return "Enter a phone number"
        case .need_13_characters:
            return "The number of characters is off. Make sure that the number is properly formatted."
        case .is_phone_number_formatted:
            return "The phone number is improperly formatted."
        case .no_emailaddress:
            return "Enter an email address."
        case .invalid_email_formatting:
            return "The email formatted improperly."
        case .no_username:
            return "Enter a username"
        case .only_alpha_numeric_chars_username:
            return "Enter only alpha-numeric characters for the username."
        case .username_must_have_4_chars:
            return "Username must have at least 4 characters."
        case .username_must_have_lessthan_15:
            return "Username must have less than 15 characters."
        case .no_password:
            return "Enter a password."
        case .password_must_have_4_characters:
            return "Password needs to be entered and must be longer than 4 characters."
        case .password_must_have_capital_letter:
            return "The password must have at least one capital letter."
        case .password_must_be_alpha_numeric:
            return "The password must have ONLY alpha-numeric characters."
        }
    }
}




