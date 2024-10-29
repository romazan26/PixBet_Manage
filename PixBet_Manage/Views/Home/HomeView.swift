//
//  HomeView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vmHome = HomeViewModel()
    var body: some View {
        NavigationView{
            
            ZStack {
                BackgroundMain()
                VStack {
                    //MARK: - Player
                    PlayerInfoView(vm: vmHome)
                    
                    //MARK: - List or Settings view
                    HStack {
                        //MARK: List button
                        NavigationLink {
                            ///
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
                        ///
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
                    NoTraininfCellView()
                    
                    Spacer()
                }.padding()
                
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
