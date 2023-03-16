//
//  SchoolCellView.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct SchoolCellView: View {
    let viewModel: SchoolListViewModel
    let school: NYCSchool
    var body: some View {
        HStack {
            HStack {
                HStack {
                    VStack(spacing: 8.0) {
                        HStack {
                            Text(school.school_name)
                                .font(.system(size: isIpad ? 32.0 : 20.0).bold())
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .foregroundColor(.blue)
                        
                        if let addressLine1 = viewModel.schoolAddressLine1(school: school), let addressLine2 = viewModel.schoolAddressLine2(school: school) {
                            
                            VStack {
                                if isIpad {
                                    HStack {
                                        Text(addressLine1)
                                            .font(.system(size: 24.0).bold())
                                        Spacer()
                                            .frame(width: 16.0)
                                        Text(addressLine2)
                                            .font(.system(size: 24.0).bold())
                                        Spacer()
                                    }
                                } else {
                                    HStack {
                                        Text(addressLine1)
                                            .font(.system(size: 15.0).bold())
                                        Spacer()
                                    }
                                    HStack {
                                        Text(addressLine2)
                                            .font(.system(size: 15.0).bold())
                                        Spacer()
                                    }
                                }
                            }
                            .foregroundColor(.blue.opacity(0.777))
                            .padding(.all, isIpad ? 8.0 : 4.0)
                            .padding(.horizontal, isIpad ? 8.0 : 4.0)
                            .box(backgroundColor: .white,
                                 strokeColor: .blue,
                                 cornerRadius: 6.0,
                                 strokeWidth: isIpad ? 3.0 : 2.0)
                        }
                    }
                    .padding(.all, 8.0)
                }
                .box(backgroundColor: .white,
                     strokeColor: .blue,
                     cornerRadius: 14.0,
                     strokeWidth: isIpad ? 3.0 : 2.0)
            }
            .padding(.horizontal, 8.0)
        }
    }
}

struct SchoolCellView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolCellView(viewModel: .init(application: .init()),
                       school: NYCSchool.mock)
    }
}
