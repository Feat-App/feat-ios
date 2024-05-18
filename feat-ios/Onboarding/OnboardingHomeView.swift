//
//  OnboardingHomeView.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI

struct OnboardingHomeView: View {
    var body: some View {
        VStack {
            Text("Feat")
                .font(AppFonts.font(style: .bold, size: 60))
                .foregroundColor(.black)
        }.padding(29)
    }
}

#Preview {
    OnboardingHomeView()
}
