//
//  SettingButton.swift
//  KTO_Training Notebook
//
//  Created by Роман on 13.10.2024.
//

import SwiftUI

struct SettingButton: View {
    var text = ""
    var image = ""
    var body: some View {
        ZStack {
            Color(.white)
                .opacity(0.05)
                .cornerRadius(32)
                
            HStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.greenApp)
                Spacer()
                Text(text)
                Spacer()
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.greenApp)
                
            }
            .padding(.horizontal, 35)
            .foregroundStyle(.white)
            .font(.system(size: 15, weight: .heavy))
        }
        .frame(width: 358, height: 66)
    }
}

#Preview {
    ZStack {
        Color.main
        SettingButton(text: "Share", image: "heart.fill")
    }
}
