//
//  OnboardingMenuItemView.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI

struct OnboardingMenuItemViewModel {
    let title: String
    let iconName: String
}

struct OnboardingMenuItemView: View {
    private var viewModel: OnboardingMenuItemViewModel

    init(viewModel: OnboardingMenuItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text(viewModel.title)
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
                iconName: ""
            )
        )
    }
    .frame(maxHeight: .infinity)
    .padding(15)
    .background(Color.gray3)
}

