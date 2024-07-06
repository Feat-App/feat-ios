import SwiftUI

struct ButtonSubmitViewModel: Hashable, Identifiable {
    let id: UUID
    let title: String
    let icon: ImageResource?
    let destination: OnboardingDestinationView?
    let action: (() -> Void)?

    init(
        title: String,
        icon: ImageResource? = nil,
        destination: OnboardingDestinationView?,
        action: (() -> Void)? = nil
    ) {
        self.id = UUID()
        self.title = title
        self.icon = icon
        self.destination = destination
        self.action = action
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.icon == rhs.icon && lhs.destination == rhs.destination
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(icon)
        hasher.combine(destination)
    }
}

struct ButtonSubmitView: View {
    private var viewModel: ButtonSubmitViewModel
    @State private var isPressed: Bool = false

    private let logoBoxWidth = 75.0

    init(viewModel: ButtonSubmitViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Button(action: {
            viewModel.action?()
        }, label: {
            ZStack {
                HStack {
                    Text(viewModel.title)
                        .font(AppFonts.font(style: .bold, size: 22))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, logoBoxWidth)

                if let icon = viewModel.icon {
                    HStack {
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
            .background(.black)
            .cornerRadius(100)
            .scaleEffect(isPressed ? 0.95 : 1.0)
        })
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    withAnimation {
                        isPressed = true
                    }
                })
                .onEnded({ _ in
                    withAnimation {
                        isPressed = false
                    }
                })
        )
    }
}

#Preview {
    VStack {
        OnboardingMenuItemView(
            viewModel: .init(
                title: "Sign up with Google",
                icon: .googleLogo,
                destination: .onboardingEmailSignup,
                action: nil
            )
        )
    }
    .frame(maxHeight: .infinity)
    .padding(15)
    .background(Color.gray3)
}

