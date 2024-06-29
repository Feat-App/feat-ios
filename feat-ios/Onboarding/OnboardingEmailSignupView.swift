import SwiftUI

struct OnboardingEmailSignupView: View {
    var body: some View {
            VStack(spacing: 18) {
                Spacer()
                    .frame(maxHeight: .infinity)
                
                LabelFieldView(viewModel: .init(label: "First Name"))
                LabelFieldView(viewModel: .init(label: "Last Name"))
                LabelFieldView(viewModel: .init(label: "Email"))
                
                Spacer()
                    .frame(maxHeight: .infinity)
                NavigationLink(destination: OnboardingDestinationView.onboardingEmailSignup.view) {
                    ButtonSubmitView(viewModel: .next)
                }

//                Button {
//                    OnboardingDestinationView.onboardingEmailSignup
//                } label: {
//                    ButtonSubmitView(viewModel: .next)
//                }
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
