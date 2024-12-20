//
//  CustomButtonView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var text: String
    var color: ColorResource = .greenApp
    var height: CGFloat = 50
    var body: some View {
        ZStack {
            Color(color).cornerRadius(12)
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 17, weight: .bold))
        }.frame(height: height)
    }
}

#Preview {
    CustomButtonView(text: "Next")
}
