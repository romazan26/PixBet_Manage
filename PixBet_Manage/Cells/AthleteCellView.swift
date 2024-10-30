//
//  AthleteCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct AthleteCellView: View {
    @ObservedObject var athlete: Athlet
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            VStack(alignment: .leading) {
                HStack{
                    VStack{
                        //MARK: - Foto
                        if let image = athlete.foto {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 62, height: 62)
                                .cornerRadius(100)
                                .aspectRatio(contentMode: .fit)
                        }else{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 62, height: 62)
                                .cornerRadius(100)
                        }
                        
                        //MARK: - Gender user
                        Text(athlete.gender ? "Men" : "Women")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background { Color.greenApp.cornerRadius(16) }
                    }
                    HStack{
                        //MARK: Age user
                        VStack{
                            Text("Age")
                            Text("\(athlete.age)" )
                        }.foregroundStyle(.white)
                        
                        //MARK: Weight user
                        VStack{
                            Text("Weight")
                            Text("\(athlete.weight)" )
                        }.foregroundStyle(.white)
                        
                        //MARK: Height user
                        VStack{
                            Text("Height")
                            Text("\(athlete.height)" )
                        }.foregroundStyle(.white)
                    }
                }
                //MARK: - Name
                Text(athlete.name ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                //MARK: - Discription
                Text(athlete.descript ?? "")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
            }.padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 243)
    }
}

//#Preview {
//    AthleteCellView(athlete: Athlet())
//}
