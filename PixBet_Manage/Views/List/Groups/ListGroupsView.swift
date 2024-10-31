//
//  ListGroupsView.swift
//  PixBet_Manage
//
//  Created by Роман on 29.10.2024.
//

import SwiftUI

struct ListGroupsView: View {
    @StateObject var vm: ListViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                if vm.groups.isEmpty {
                    NoDataEvailableCell()
                    Spacer()
                }else{
                    //MARK: - Athlete list
                    ScrollView{
                        ForEach(vm.groups) { group in
                            NavigationLink {
                                GroupView(vm: vm, group: group).onAppear {
                                    print("Appear")
                                    vm.getAtheletesListForGroup(group: group)
                                }
                            } label: {
                                GroupCellView(group: group)
                            }
                        }
                    }
                }
                
            }
            
            //MARK: - ADD button
            NavigationLink {
                AddGroupView(vm: vm)
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.greenApp)
            }.padding()
        }
    }
}
