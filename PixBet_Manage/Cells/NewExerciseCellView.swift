

import SwiftUI

struct NewExerciseCellView: View {
    @FocusState private var keyboardIsFocused: Bool
    @Binding var text: String
    var body: some View {
        VStack{
            TextField(text: $text) {
                Text("Text")
                    .foregroundStyle(.white.opacity(0.2))
            }
            .focused($keyboardIsFocused)
            .foregroundStyle(.white)
            .padding()
            .background {
                Color.white.opacity(0.1).cornerRadius(12)
            }
        }.onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {
    NewExerciseCellView(text: .constant("sing"))
        .background {
            Color.black.ignoresSafeArea()
        }
}
