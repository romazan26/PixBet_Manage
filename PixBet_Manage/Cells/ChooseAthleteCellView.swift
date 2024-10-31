//
//  ChooseAthleteCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import SwiftUI

struct ChooseAthleteCellView: View {
    var choose: Bool = false
    let athlete: Athlet
    var body: some View {
        ZStack {
            Color.second.cornerRadius(16)
            HStack {
                Image(systemName: choose ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(choose ? .blue : .white)
                
                Text(athlete.name ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                Spacer()
                //MARK: - Gender user
                Text(athlete.gender ? "Men" : "Women")
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.5)
                    .padding(10)
                    .frame(width: 70)
                    .background { Color.greenApp.cornerRadius(16) }
            }.padding()
        }.frame(height: 76)
    }
}

#Preview {
    ChooseAthleteCellView( athlete: Athlet())
}
