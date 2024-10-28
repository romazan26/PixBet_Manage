//
//  NoTraininfCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct NoTraininfCellView: View {
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            VStack(spacing: 10) {
                Text("No data available")
                    .foregroundStyle(.white)
                    .font(.system(size: 28, weight: .bold))
                Text("You haven't added any entries")
                    .foregroundStyle(.gray)
                    .font(.system(size: 13))
            }
        }
        .frame(maxWidth: .infinity)
            .frame(height: 167)
    }
}

#Preview {
    ZStack {
        Color.main
        NoTraininfCellView()
    }
}
