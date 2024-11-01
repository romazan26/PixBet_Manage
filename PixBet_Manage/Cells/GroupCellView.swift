//
//  GroupCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import SwiftUI

struct GroupCellView: View {
    @ObservedObject var group: Group
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            HStack {
                Image(.medal)
                    .resizable()
                    .frame(width: 62, height: 62)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(group.title ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity)
                    Text(group.descript ?? "")
                        .foregroundStyle(.gray)
                        
                        
                }.frame(maxWidth: .infinity)
            }.padding()
        }
        .frame(height: 134)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GroupCellView(group: Group())
}
