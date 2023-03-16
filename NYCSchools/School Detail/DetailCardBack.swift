//
//  DetailCardBack.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct DetailCardBack: View {
    var schoolListViewModel: SchoolListViewModel
    let school: NYCSchool
    let sat: NYCSAT
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text("SAT Scores")
                .padding(.horizontal, isIpad ? 24.0 : 16.0)
                .multilineTextAlignment(.center)
                .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                .padding(.vertical, 16.0)
            
            HStack {
                Spacer()
            }
            .frame(height: 2.0)
            .background(Color.blue)
            
            Spacer()

            HStack(spacing: 0.0) {
                VStack {
                    Text("Math Scores")
                        .font(.system(size: isIpad ? 32.0 : 20.0))
                    
                    if let satMathScore = schoolListViewModel.satMathScore(sat: sat) {
                        Text(satMathScore)
                            .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                    }
                    
                }
                .frame(width: width / 3.0)
                
                VStack {
                    Text("Reading Scores")
                        .font(.system(size: isIpad ? 32.0 : 20.0))
                    
                    if let satCriticalReadingScore = schoolListViewModel.satCriticalReadingScore(sat: sat) {
                        Text(satCriticalReadingScore)
                            .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                    }
                    
                }
                .frame(width: width / 3.0)
                
                VStack {
                    Text("Writing Scores")
                        .font(.system(size: isIpad ? 32.0 : 20.0))
                    
                    if let satWritingScore = schoolListViewModel.satWritingScore(sat: sat) {
                        Text(satWritingScore)
                            .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                    }
                }
                .frame(width: width / 3.0)
            }
            
            Spacer()
            
            HStack {
                Spacer()
            }
            .frame(height: 2.0)
            .background(Color.blue)
            
            VStack {
                Button {
                    action()
                } label: {
                    Text("Tap To See School Info")
                        .padding(.horizontal, isIpad ? 24.0 : 16.0)
                        .multilineTextAlignment(.center)
                        .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                        .padding(.vertical, 16.0)
                }
            }
        }
        .foregroundColor(.blue)
        .frame(width: width, height: height)
        .box(backgroundColor: .white,
             strokeColor: .blue,
             cornerRadius: 24.0,
             strokeWidth: isIpad ? 3.0 : 2.0)
    }
}

struct DetailCardBack_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardBack(schoolListViewModel: .init(application: .init()),
                       school: NYCSchool.mock,
                       sat: NYCSAT.mock,
                       width: 300.0, height: 300.0) { }
    }
}
