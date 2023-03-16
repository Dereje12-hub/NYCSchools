//
//  NYCSAT.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import Foundation

struct NYCSAT: Decodable {
    let sat_math_avg_score: String?
    let sat_critical_reading_avg_score: String?
    let sat_writing_avg_score: String?
    let num_of_sat_test_takers: String?
}

extension NYCSAT {
    static var mock: NYCSAT {
        return NYCSAT(sat_math_avg_score: "160", sat_critical_reading_avg_score: "175", sat_writing_avg_score: "185", num_of_sat_test_takers: "2000")
    }
}
