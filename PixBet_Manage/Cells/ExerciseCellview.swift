//
//  ExerciseCellview.swift
//  PixBet_Manage
//
//  Created by Роман on 01.11.2024.
//

import SwiftUI

struct ExerciseCellview: View {
    @ObservedObject var exercise: Exercise
    var body: some View {
        ZStack{
            Color.second.cornerRadius(20)
            HStack{
                Image(systemName: exercise.complited ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(exercise.complited  ? .blue : .white)
                    .padding(.horizontal)
                Text(exercise.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17))
                Spacer()
            }
            .padding()
        }.frame(height: 54)
        
    }
}

