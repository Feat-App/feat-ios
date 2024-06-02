//
//  OnboardingMenuItemView.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI

struct OnboardingMenuItemViewModel {
    let title: String
    let icon: ImageResource?

    init(title: String, icon: ImageResource? = nil) {
        self.title = title
        self.icon = icon
    }
}

struct OnboardingMenuItemView: View {
    private var viewModel: OnboardingMenuItemViewModel

    private let logoBoxWidth = 75.0

    init(viewModel: OnboardingMenuItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text(viewModel.title)
            }
            .padding(.horizontal, logoBoxWidth)

            if let icon = viewModel.icon {
                HStack() {
                    HStack(alignment: .center) {
                        Image(icon)
                    }
                    .frame(width: logoBoxWidth)

                    Spacer()
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(height: 65)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(100)
    }
}

#Preview {
    VStack {
        OnboardingMenuItemView(
            viewModel: .init(
                title: "Sign up with Google",
                icon: .googleLogo
            )
        )
    }
    .frame(maxHeight: .infinity)
    .padding(15)
    .background(Color.gray3)
}

