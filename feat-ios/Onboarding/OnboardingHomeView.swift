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

            Text("Join for free and start tracking your nutrition in the easiest way.")
                .multilineTextAlignment(.center)
                .font(AppFonts.font(style: .regular, size: 16))
                .foregroundColor(.gray3)
                .padding(10)

            OnboardingMenuItemView(
                viewModel: .init(
                    title: "Sign up with Google",
                    icon: .googleLogo
                )
            )
        }
        .padding(29)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.gray5)
    }
}

#Preview {
    OnboardingHomeView()
}
