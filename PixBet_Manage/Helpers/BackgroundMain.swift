//
//  BackgroundMain.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//
import SwiftUI

struct BackgroundMain: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.main
                Image(.inventar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        }.ignoresSafeArea()
    }
}
