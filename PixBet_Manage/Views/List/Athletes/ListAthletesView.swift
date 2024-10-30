//
//  ListAthletesView.swift
//  PixBet_Manage
//
//  Created by Роман on 29.10.2024.
//

import SwiftUI

struct ListAthletesView: View {
    @StateObject var vm: ListViewModel
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                if vm.atheletes.isEmpty {
                    NoDataEvailableCell()
                    Spacer()
                }else{
                    //MARK: - Athlete list
                    ScrollView{
                        ForEach(vm.atheletes) { athlete in
                            NavigationLink {
                                AthleteView(vm: vm, athlete: athlete)
                            } label: {
                                AthleteCellView(athlete: athlete)
                            } 
                        }
                    }
                }
                
            }
            
            //MARK: - ADD button
            NavigationLink {
                AddListAtheleView(vm: vm)
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
    ListAthletesView(vm: ListViewModel())
}
