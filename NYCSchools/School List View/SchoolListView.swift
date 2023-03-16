//
//  SchoolListView.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var schoolListViewModel: SchoolListViewModel
    var body: some View {
        ZStack {
            
            Spacer()
            
            if schoolListViewModel.didFailToDownloadSchools {
                errorView()
            } else {
                schoolListView()
            }
            
            if schoolListViewModel.isDownloadingSchools || schoolListViewModel.isDownloadingSATs {
                LoadingView()
            }
        }
        .alert("Could not download SAT scores, please try again!", isPresented: $schoolListViewModel.didFailToDownloadSATs) {
            Button("Okay") { }
        }
        .navigationDestination(for: SchoolListViewModel.SATResults.self) { satResult in
            SATScoresView(schoolListViewModel: schoolListViewModel,
                          school: satResult.school,
                          sat: satResult.sat)
        }
        
    }
    
    func schoolListView() -> some View {
        VStack {
            ScrollView {
                ForEach(schoolListViewModel.schools) { school in
                    Button {
                        
                        schoolListViewModel.selectSchoolIntent(school: school)
                        
                    } label: {
                        SchoolCellView(viewModel: schoolListViewModel,
                                       school: school)
                    }
                }
            }
        }
    }
    
    func errorView() -> some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.yellow)
                    Text("Unable to download data...")
                        .foregroundColor(.yellow)
                        .font(.title3.bold())
                        .padding(.top, 12)
                    Button {
                        schoolListViewModel.downloadSchools()
                    } label: {
                        HStack {
                            Text("Retry")
                                .font(.title3.bold())
                                .foregroundColor(.yellow)
                                .padding(.all, 16.0)
                        }
                        .box(backgroundColor: .white,
                             strokeColor: .blue,
                             cornerRadius: 12.0,
                             strokeWidth: 6.0)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .background(Color.black)
    }
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView(schoolListViewModel: .init(application: .init()))
    }
}
