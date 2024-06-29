import SwiftUI

class LabelFieldViewModel: ObservableObject {
    let label: String
    let placeHolder: String
    @Published var text: String = ""

    init(label: String, placeHolder: String = "", text: String = "") {
        self.text = text
        self.label = label
        self.placeHolder = placeHolder
    }
}

struct LabelFieldView: View {
    @ObservedObject private var viewModel: LabelFieldViewModel

    init(viewModel: LabelFieldViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.label)
                .font(AppFonts.font(style: .semiBold, size: 18))

            TextField(viewModel.placeHolder, text: $viewModel.text)
                .font(AppFonts.font(style: .semiBold, size: 24))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer()
                .frame(maxHeight: .infinity)
        }
        .padding(0)
        .frame(height: 100)
    }
}

#Preview {
    LabelFieldView(viewModel: .init(label: "Label"))
}
