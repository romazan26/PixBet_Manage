//
//  TrainingsView.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import SwiftUI

struct TrainingsView: View {
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Training")
                    .font(.title)
                    .foregroundStyle(.white)
                
                //MARK: - List type of training
                typeTrainingsListView(vm: vm)
                
                //MARK: - List of Training
                ScrollView {
                    if vm.chooseTypeTraining == "All"{
                        if vm.trainings.isEmpty{
                            NoDataEvailableCell()
                        }
                        ForEach(vm.trainings) { training in
                            NavigationLink {
                                TrainingView(training: training, vm: vm)
                            } label: {
                                TrainingCellView(training: training)
                            }

                           
                        }
                    }else{
                        if vm.sortTrainings.isEmpty{
                            NoDataEvailableCell()
                        }
                        ForEach(vm.sortTrainings) { training in
                            NavigationLink {
                                TrainingView(training: training, vm: vm)
                            } label: {
                                TrainingCellView(training: training)
                            }
                        }
                    }
                }
                
                Spacer()
            }.padding()
            //MARK: - ADD button
            NavigationLink {
                AddTrainingView(vm: vm)
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.greenApp)
            }.padding()
        }
    }
}

#Preview {
    TrainingsView(vm: TrainingsViewModel())
}
