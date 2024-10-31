//
//  AthleteCellOfGroup.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import SwiftUI

struct AthleteCellOfGroup: View {
    @ObservedObject var athlete: Athlet
    var body: some View {
        ZStack {
            Color.second.cornerRadius(20)
            HStack {
                //MARK: - Photo athlete
                if let image = athlete.foto {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        
                }else{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundStyle(.gray)
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
                //MARK: - Name athlete
                Text(athlete.name ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                
                Spacer()
                
                //MARK: - Gender
                Text(athlete.gender ? "Men" : "Women")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background { Color.greenApp.cornerRadius(16) }
            }
            .padding()
        }.frame(height: 64)
    }
}

#Preview {
    AthleteCellOfGroup(athlete: Athlet())
}
