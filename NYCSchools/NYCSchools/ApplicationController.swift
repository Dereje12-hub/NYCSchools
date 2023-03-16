//
//  ApplicationController.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import Foundation

class ApplicationController {
    
    let network = NetworkManager()
    
    lazy var schoolListViewModel: SchoolListViewModel = {
        SchoolListViewModel(application: self)
    }()
}
