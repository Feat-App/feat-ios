//
//  OnboardingHomeView.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI

struct OnboardingHomeViewModel {
    let menuItems: [OnboardingMenuItemViewModel]
}

struct OnboardingHomeView: View {
    let viewModel: OnboardingHomeViewModel
   
    // Dynamic Navigation
    @State private var isActive = false
    @State private var destinationView: OnboardingDestinationView?

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()

                    Text("Feat")
                        .font(AppFonts.font(style: .bold, size: 60))
                        .foregroundColor(.black)

                    Spacer()
                }

                Text("Join for free and start tracking your nutrition in the easiest way.")
                    .multilineTextAlignment(.center)
                    .font(AppFonts.font(style: .regular, size: 16))
                    .foregroundColor(.gray3)
                    .padding(10)

                ForEach(viewModel.menuItems) { item in
                    Button {
                        // Set the destination view and activate the navigation link
                        destinationView = item.destination
                        isActive = true
                    } label: {
                        OnboardingMenuItemView(viewModel: item)
                    }

                    Spacer()
                        .frame(height: 18)
                }

                HStack {
                    Text("Already have an account? ")
                        .foregroundColor(.gray3)
                        .font(AppFonts.font(style: .regular, size: 16))
                    
                    Text("Sign in here")
                        .foregroundColor(.blueLight)
                        .font(AppFonts.font(style: .regular, size: 16))
                        .onTapGesture {
                            destinationView = .onboardingEmailSignup
                            isActive = true
                        }
                }
                .multilineTextAlignment(.center)
                .padding(10)
            }
            .padding(29)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(Color.gray5)
            .background(
                NavigationLink(destination: destinationView?.view, isActive: $isActive) {
                    destinationView?.view
                }
            )
        }
    }
}

#Preview {
    OnboardingHomeView(viewModel: .defaultModel)
}

extension OnboardingHomeViewModel {
    static let defaultModel = OnboardingHomeViewModel(
        menuItems: [.google, .apple, .facebook, .email]
    )
}

extension OnboardingMenuItemViewModel {
    static let google = Self(
        title: "Sign up with Google",
        icon: .googleLogo,
        destination: nil
    )

    static let apple = Self(
        title: "Sign up with Apple",
        icon: .appleLogo,
        destination: nil
    )

    static let facebook = Self(
        title: "Sign up with Facebook",
        icon: .facebookLogo,
        destination: nil
    )

    static let email = Self(
        title: "Sign up with Email",
        icon: .emailLogo,
        destination: .onboardingEmailSignup
    )
}
