//
//  NYCSchool.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import Foundation

struct NYCSchool: Decodable {
    let dbn: String
    let school_name: String
    let overview_paragraph: String?
    let phone_number: String?
    let school_email: String?
    let website: String?
    
    let primary_address_line_1: String?
    let city: String?
    let zip: String?
    let state_code: String?
}

extension NYCSchool: Identifiable {
    var id: String { dbn }
}

extension NYCSchool {
    
    static var mock: NYCSchool {
        return NYCSchool(dbn: "0123",
                         school_name: "Bronx School",
                         overview_paragraph: "This is a school in The Bronx.",
                         phone_number: "1-800-BAD-NEWS",
                         school_email: "badnews@bronxschool.com",
                         website: "www.bronxschool.com",
                         primary_address_line_1: "10 East 15th Street",
                         city: "New York",
                         zip: "10003",
                         state_code: "NY")
    }
    
}
