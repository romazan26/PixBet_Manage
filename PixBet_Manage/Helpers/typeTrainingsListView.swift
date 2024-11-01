//
//  genreLstView.swift
//  Movieplanner
//
//  Created by Роман on 10.06.2024.
//

import SwiftUI

struct typeTrainingsListView: View {
    @StateObject var vm: TrainingsViewModel
    let items = TrainingType.allCases
    let screenWidth: CGFloat = 360
    @State var groupedItems: [[String]] = [[String]]()
    
    private  func createGroupItems(_ items: [TrainingType]) -> [[String]]{
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var wigth: CGFloat = 0
        
        for word in items {
            let label = UILabel()
            label.text = word.title
            label.sizeToFit()
            
            let labelWidth = label.frame.width + 32
            
            if (wigth + labelWidth + 32) < screenWidth {
                wigth += labelWidth
                tempItems.append(word.title)
            }else {
                wigth = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word.title)
            }
        }
        groupedItems.append(tempItems)
        
        return groupedItems
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(groupedItems, id: \.self) { subItem in
                HStack{
                    ForEach(subItem, id: \.self) { word in
                        Text(word)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background {
                                ZStack {
                                    Color(vm.chooseTypeTraining == word ? .greenApp : .second)
                                        .cornerRadius(12)
                                    Color(vm.simpleTypeString == word ? .greenApp : .second)
                                    .cornerRadius(12)
                                    .opacity(vm.isEditTraining ? 1 : 0)
                                } }
                            .onTapGesture {
                                
                                if !vm.isEditTraining {
                                    vm.chooseTypeTraining = word
                                    vm.filterTrainings()
                                }else{
                                    vm.simpleTypeString = word
                                }
                            }
                            
                    }
                }
            }
        }.onAppear {
            groupedItems = createGroupItems(items)
        }
    }
}

#Preview {
    typeTrainingsListView(vm: TrainingsViewModel())
}
