//
//  TrainingCellView.swift
//  PixBet_Manage
//
//  Created by Роман on 01.11.2024.
//

import SwiftUI

struct TrainingCellView: View {
    @ObservedObject var training: Training
    var body: some View {
        ZStack {
            Color.second.cornerRadius(32)
            VStack(alignment: .leading) {
                HStack {
                    //MAR: type
                    Text(training.type ?? "")
                        .font(.system(size: 11))
                        .foregroundStyle(.white)
                        .padding(8)
                        .background {
                            Color.greenApp.cornerRadius(16)
                        }
                    
                    Spacer()
                    
                    //MARK: Level
                    Text(training.complexity ?? "")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16,weight: .bold))
                }
                
                //MARK: - title training
                Text(training.title ?? "")
                    .font(.system(size: 17,weight: .bold))
                    .foregroundStyle(.white)
                
                //MARK: - Description training
                Text(training.descript ?? "")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
                    .padding(.top)
                
                Spacer()
            }.padding()
        }.frame(height: 167)
    }
}
