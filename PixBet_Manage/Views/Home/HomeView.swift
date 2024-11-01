//
//  HomeView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vmHome = HomeViewModel()
    @StateObject var vmTraining = TrainingsViewModel()
    var body: some View {
        NavigationView{
            
            ZStack {
                BackgroundMain()
                ScrollView{
                    VStack {
                        //MARK: - Player
                        PlayerInfoView(vm: vmHome)
                        
                        //MARK: - List or Settings view
                        HStack {
                            //MARK: List button
                            NavigationLink {
                                ListView()
                            } label: {
                                CustomButtonView(text: "List of groups")
                            }
                            
                            Spacer()
                            
                            //MARK: Settings button
                            Button {
                                vmHome.isPresentSetting = true
                            } label: {
                                CustomButtonView(text: "Settings", color: .second)
                            }
                        }
                        
                        //MARK: - Trainings
                        NavigationLink {
                            TrainingsView(vm: vmTraining)
                        } label: {
                            HStack{
                                Text("Training")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 28, weight: .bold))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 14, height: 20)
                                    .foregroundStyle(.greenApp)
                            }
                        }
                        
                        //MARK: - Training cell
                        if vmTraining.trainings.isEmpty {
                            NoTraininfCellView()
                        }else{
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    ForEach(vmTraining.trainings.prefix(3)) { training in
                                        TrainingCellView(training: training)
                                            .frame(width: 350)
                                    }
                                }
                            }
                        }
                        
                        
                        Spacer()
                    }.padding()
                }
                if vmHome.isPresentSetting {
                    SettingsView(isPresent: $vmHome.isPresentSetting)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
