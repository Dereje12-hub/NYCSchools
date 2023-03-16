//
//  NYCSchoolsApp.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

var isIpad: Bool {
    UIDevice.current.userInterfaceIdiom == .pad
}

@main
struct NYCSchoolsApp: App {
    let appController = ApplicationController()
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(schoolListViewModel: appController.schoolListViewModel)
        }
    }
}
