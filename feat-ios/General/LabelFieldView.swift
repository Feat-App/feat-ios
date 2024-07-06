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
    @FocusState private var focusedField: Bool

    init(viewModel: LabelFieldViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Button(action: {
                focusedField = true
            }, label: {
                Text(viewModel.label)
                    .font(AppFonts.font(style: .semiBold, size: 18))
            })
            .buttonStyle(.plain)

            TextField(viewModel.placeHolder, text: $viewModel.text)
                .font(AppFonts.font(style: .regular, size: 18))
                .textFieldStyle(PlainTextFieldStyle())
                .focused($focusedField)
                .padding([.vertical], 4)
                .padding([.horizontal], 15)
                .frame(height: 65)
                .overlay(
                    Button(action: {
                        focusedField = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.clear)
                    })
                )
                .background(.white)
                .cornerRadius(10)
                .foregroundStyle(.black)

            Spacer()
                .frame(height: 14)
        }
        .padding(0)
    }

    // TODO: Apply the field color
    // https://stackoverflow.com/questions/62040461/swiftui-mask-a-rectangle-inside-a-rounded-rectangle
    private func textFieldColor() -> Color {
        return focusedField ? .gray1 : .white
    }
}

#Preview {
    LabelFieldView(viewModel: .init(label: "Label"))
}
