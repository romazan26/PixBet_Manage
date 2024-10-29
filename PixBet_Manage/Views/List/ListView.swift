//
//  ListView.swift
//  PixBet_Manage
//
//  Created by Роман on 29.10.2024.
//

import SwiftUI

struct ListView: View {
    @StateObject var vm = ListViewModel()
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Title view
                HStack {
                    Text("List")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .bold))
                    Spacer()
                }
                
                //MARK: - Swich Athletes or Gorups
                CustomSwitchButtonView(isOn: $vm.isChooseView,
                                       nameFirst: "Athletes",
                                       nameSecond: "Groups")
                
                //MARK: - Choose view
                if vm.isChooseView {
                    ListAthletesView()
                } else {
                    ListGroupsView()
                }
                Spacer()
                
            }.padding()
        }
    }
}

#Preview {
    ListView()
}
