//
//  CustomSwitchButtonView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct CustomSwitchButtonView: View {
    @Binding var isOn: Bool
    var nameFirst: String
    var nameSecond: String
    
    var body: some View {
        HStack {
            //MARK: - First
            Button {
                isOn = true
            } label: {
                CustomButtonView(text: nameFirst, color: isOn ? .greenApp : .second, height: 28)
            }
            
            Spacer()
            
            //MARK: - Second
            Button {
                isOn = false
            } label: {
                CustomButtonView(text: nameSecond, color: !isOn ? .greenApp : .second, height: 28)
            }
        }
    }
}

#Preview {
    CustomSwitchButtonView(isOn: .constant(true || false), nameFirst: "List", nameSecond: "Grid")
}
