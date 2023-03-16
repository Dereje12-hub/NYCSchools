//
//  LoadingView.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.blue)
                    .scaleEffect(1.70)
                Spacer()
            }
            
            Spacer()
        }
        .background(Color.white.opacity(0.75))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
