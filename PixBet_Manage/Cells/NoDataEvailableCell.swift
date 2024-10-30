//
//  NoDataEvailableCell.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct NoDataEvailableCell: View {
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            VStack {
                Text("No data available")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
                Text("You haven't added any entries")
                    .foregroundStyle(.gray)
                Image(.medal)
                    .resizable()
                    .frame(width: 180, height: 180)
            }
        }.frame(height: 284)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    NoDataEvailableCell()
}
