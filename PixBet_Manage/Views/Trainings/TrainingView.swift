//
//  TrainingView.swift
//  PixBet_Manage
//
//  Created by Роман on 01.11.2024.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var training: Training
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack(){
            //MARK: - background
            Color.main.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack(alignment: .leading){
                //MARK: Training title
                Text(training.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .bold))
                
                //MARK: Type and level
                HStack {
                    //MARK: type
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
                
                //MARK: Description
                Text(training.descript ?? "")
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                    
                //MARK: Exercse list
                if let exercises = training.exercise?.allObjects as? [Exercise] {
                    ScrollView{
                        ForEach(exercises) { exercise in
                            ExerciseCellview(exercise: exercise)
                                .onTapGesture {
                                    vm.completeExercise(exercise: exercise)
                                }
                        }
                    }
                }
                
                Spacer()
                
                //MARK: - buttons group
                HStack {
                    //MARK: - Delete button
                    Button {
                        vm.deleteTraining(training: training)
                    } label: {
                        CustomButtonView(text: "Delete", color: .second)
                    }
                    
                    //Edit button
                    NavigationLink {
                        AddTrainingView(vm: vm).onAppear {
                            vm.getEditTraining(training: training)
                            vm.simpleTraining = training
                            vm.isEditTraining = true
                        }
                    } label: {
                        CustomButtonView(text: "Edit")
                    }

                }
            }
            .padding()
        }
        
    }
}

#Preview {
    TrainingView(training: Training(), vm: TrainingsViewModel())
}
