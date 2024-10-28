//
//  CustomButtonView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var text: String
    var body: some View {
        ZStack {
            Color.greenApp.cornerRadius(12)
            Text(text)
                .foregroundStyle(.white)
        }.frame(height: 50)
    }
}

#Preview {
    CustomButtonView(text: "Next")
}
