//
//  NavigationContainerView.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct NavigationContainerView: View {
    @ObservedObject var schoolListViewModel: SchoolListViewModel
    var body: some View {
        NavigationStack(path: $schoolListViewModel.navigationPath) {
            SchoolListView(schoolListViewModel: schoolListViewModel)
        }
    }
}

struct NavigationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContainerView(schoolListViewModel: .init(application: .init()))
    }
}
