//
//  ComplexityCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 01.11.2024.
//

import SwiftUI

struct ComplexityCellView: View {
    let text: String
    var isSelected: Bool
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(isSelected ? .blue : .white)
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 17))
            }
        }
        .frame(height: 44)
        .overlay {
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.greenApp, lineWidth: 2)
                .opacity(isSelected ? 1 : 0)
        }
    }
}

#Preview {
    ComplexityCellView(text: "Easy", isSelected: true)
}
