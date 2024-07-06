import SwiftUI

struct OnboardingEmailSignupView: View {
    @State private var navigateToDetail = false

    var body: some View {
            VStack(spacing: 0) {
                Spacer()
                    .frame(maxHeight: .infinity)
                
                LabelFieldView(viewModel: .init(label: "First Name"))
                LabelFieldView(viewModel: .init(label: "Last Name"))
                LabelFieldView(viewModel: .init(label: "Email"))
                
                Spacer()
                    .frame(maxHeight: .infinity)
                
                NavigationLink(
                    destination: OnboardingDestinationView.onboardingEmailSignup.view,
                    isActive: $navigateToDetail
                ) {
                    ButtonSubmitView(
                        viewModel: .init(
                            title: "Next",
                            destination: .onboardingEmailSignup,
                            action: ({
                                navigateToDetail = true
                            })
                        )
                    )
                }
            }
            .padding(30)
            .background(Color.gray5)
        }
}

#Preview {
    OnboardingEmailSignupView()
}

extension ButtonSubmitViewModel {
    static let next = Self(
        title: "Next",
        destination: .onboardingEmailSignup
    )
}
