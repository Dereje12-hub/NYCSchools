//
//  DetailCardFront.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI
import SwiftUI

struct DetailCardFront: View {
    
    var schoolListViewModel: SchoolListViewModel
    let school: NYCSchool
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text(schoolListViewModel.schoolName(school: school))
                .padding(.horizontal, isIpad ? 24.0 : 16.0)
                .multilineTextAlignment(.center)
                .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                .padding(.vertical, 16.0)
            
            HStack {
                Spacer()
            }
            .frame(height: 2.0)
            .background(Color.blue)
            
            ScrollView {
                if let overviewParagraph = schoolListViewModel.schoolOverviewParagraph(school: school) {
                    
                    Text(overviewParagraph)
                        .padding(.horizontal, isIpad ? 18.0 : 14.0)
                        .padding(.vertical, 8.0)
                        .multilineTextAlignment(.center)
                        .font(.system(size: isIpad ? 24.0 : 16.0).bold())
                    
                }
            }
            
            HStack {
                Spacer()
            }
            .frame(height: 2.0)
            .background(Color.blue)
            
            VStack {
                Button {
                    action()
                } label: {
                    Text("Click To See Scores...")
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

struct DetailCardFront_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardFront(schoolListViewModel: .init(application: .init()),
                        school: NYCSchool.mock,
                        width: 300.0,
                        height: 300.0) { }
    }
}
