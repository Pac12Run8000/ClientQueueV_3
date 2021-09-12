//
//  SignupError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/31/21.
//

import Foundation


enum SignupError:Error {
    case client_no_first_name
    case client_no_last_name
    case client_only_alphanumeric_chars_for_lastname
    case client_no_street_address
    case client_no_city_state
    case client_no_zip_code
    case client_zip_code_is_too_short
    case client_no_phone_number
    case client_need_13_characters
    case client_is_phone_number_formatted
    case client_no_emailaddress
    case client_invalid_email_formatting
    case client_no_username
    case client_only_alpha_numeric_chars_username
    case client_username_must_have_4_chars
    case client_username_must_have_lessthan_15
    case client_no_password
    case client_password_must_have_4_characters
    case client_password_must_have_capital_letter
    case client_password_must_be_alpha_numeric
    case client_create_authentication_profile_error(err:String)
    // *****
    
    case save_profile_to_realtime_database_error
   
    // ****
    case service_provider_no_firstname
    case service_provider_no_lastname
    case service_provider_no_address
    case service_provider_no_zipcode
    case service_provider_zipcode_has_5_characters
    case service_provider_no_city_state
    case service_provider_no_phone_number
    case service_provider_phone_number_has_bad_formatting
    case service_provider_no_email
    case service_provider_invalid_email
    case service_provider_no_username
    case service_provider_only_alpha_numeric_characters_in_username
    case service_provider_username_must_have_4_characters
    case service_provider_username_less_than_15_characters
    case service_provider_no_password
    case service_provider_password_isAlpa_numeric
    case service_provider_password_4_characters
    case service_provider_password_capital_letter
    
}


extension SignupError:CustomStringConvertible {
    var description: String {
        switch self {
        case .client_no_first_name:
            return "Enter a first name"
        case .client_no_last_name:
            return "Enter a last name"
        case .client_only_alphanumeric_chars_for_lastname:
            return "Enter only alpha-numeric characters."
        case .client_no_street_address:
            return "Enter a street address."
        case .client_no_city_state:
            return "Enter a city and state"
        case .client_no_zip_code:
            return "Enter a zip code"
        case .client_zip_code_is_too_short:
            return "Enter a valid zip code that is 5 characters long."
        case .client_no_phone_number:
            return "Enter a phone number"
        case .client_need_13_characters:
            return "The number of characters is off. Make sure that the number is properly formatted."
        case .client_is_phone_number_formatted:
            return "The phone number is improperly formatted."
        case .client_no_emailaddress:
            return "Enter an email address."
        case .client_invalid_email_formatting:
            return "The email formatted improperly."
        case .client_no_username:
            return "Enter a username"
        case .client_only_alpha_numeric_chars_username:
            return "Enter only alpha-numeric characters for the username."
        case .client_username_must_have_4_chars:
            return "Username must have at least 4 characters."
        case .client_username_must_have_lessthan_15:
            return "Username must have less than 15 characters."
        case .client_no_password:
            return "Enter a password."
        case .client_password_must_have_4_characters:
            return "Password needs to be entered and must be longer than 4 characters."
        case .client_password_must_have_capital_letter:
            return "The password must have at least one capital letter."
        case .client_password_must_be_alpha_numeric:
            return "The password must have ONLY alpha-numeric characters."
        case .service_provider_no_firstname:
            return "Enter a firstname."
        case .service_provider_no_lastname:
            return "Enter a firstname."
        case .service_provider_no_address:
            return "Enter an address."
        case .service_provider_no_zipcode:
            return "Enter a zipcode."
        case .service_provider_zipcode_has_5_characters:
            return "The zip code contains 5 characters. Please enter 5 characters."
        case .service_provider_no_city_state:
            return "Enter a city and a state."
        case .service_provider_no_phone_number:
            return "Enter a phone number."
        case .service_provider_phone_number_has_bad_formatting:
            return "The number of characters is off. Make sure that the number is properly formatted."
        case .service_provider_no_email:
            return "Enter an email address."
        case .service_provider_invalid_email:
            return "The email that you entered is invalid. Re-enter the email address."
        case .service_provider_no_username:
            return "Enter a username."
        case .service_provider_only_alpha_numeric_characters_in_username:
            return "Only alpha-numeric characters are allowed in the username."
        case .service_provider_username_must_have_4_characters:
            return "Username must contain at least 4 characters."
        case .service_provider_username_less_than_15_characters:
            return "The username must be less than 15 characters."
        case .service_provider_no_password:
            return "Enter a password."
        case .service_provider_password_isAlpa_numeric:
            return "The password can only have alpha-numeric characters."
        case .service_provider_password_4_characters:
            return "The password must have at least 4 characters."
        case .service_provider_password_capital_letter:
            return "The password must have a capital letter."
        case .client_create_authentication_profile_error:
            return "There was an error adding user to the Authentication Sytem"
        case .save_profile_to_realtime_database_error:
            return "There was an error when saving your profile information."
        }
    }
}




