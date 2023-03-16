//
//  SATScoresView.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct SATScoresView: View {
    
    @State var isFaceDown = false
    var schoolListViewModel: SchoolListViewModel
    let school: NYCSchool
    let sat: NYCSAT
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    cardView(geometry: geometry)
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
            }
        }
    }
    
    func cardView(geometry: GeometryProxy) -> some View {
        var width: CGFloat = round(min(geometry.size.width, geometry.size.height) * 0.8)
        if width > 640.0 { width = 640.0}
        let height = width
        return FlippableCardView(isFaceDown: isFaceDown,
                                 front: DetailCardFront(schoolListViewModel: schoolListViewModel,
                                                        school: school,
                                                        width: width,
                                                        height: height,
                                                        action: {
            withAnimation {
                self.isFaceDown = !self.isFaceDown
            }
        }),
                                 back: DetailCardBack(schoolListViewModel: schoolListViewModel,
                                                      school: school,
                                                      sat: sat,
                                                      width: width,
                                                      height: height, action: {
            withAnimation {
                self.isFaceDown = !self.isFaceDown
            }
        }))
        
    }
    
}

struct SATScoresView_Previews: PreviewProvider {
    static var previews: some View {
        SATScoresView(schoolListViewModel: .init(application: .init()),
                      school: NYCSchool.mock,
                      sat: NYCSAT.mock)
    }
}
