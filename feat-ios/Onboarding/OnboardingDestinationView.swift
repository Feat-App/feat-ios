import SwiftUI

enum OnboardingDestinationView {
    case onboardingEmailSignup

    @ViewBuilder
    var view: some View {
        switch self {
        case .onboardingEmailSignup:
            OnboardingEmailSignupView()
        }
    }
}
