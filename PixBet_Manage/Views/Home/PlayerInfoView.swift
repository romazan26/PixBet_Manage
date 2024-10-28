//
//  PlayerInfoView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct PlayerInfoView: View {
    
    var image: Image = Image(systemName: "person.circle.fill")
    var name: String = "User name"
    var surname: String = ""
    var position: String = "Position"
    var age: String = "-"
    var experience: String = "-"
    
    var body: some View {
        VStack {
           //MARK: - Image
            HStack(alignment: .top) {
                Spacer()
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .cornerRadius(100)
                    .padding()
                    .offset(x: 25)
                Spacer()
                
                //MARK: Edite button
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.5))
            }
            
            //MARK: - Name
            HStack {
                Text(name)
                Text(surname)
            }
            .font(.system(size: 28, weight: .bold))
            .foregroundStyle(.white)
            
            //MARK: - Position
            Text(position)
                .foregroundStyle(.gray)
            
            HStack {
                //MARK: - Age
                VStack{
                    HStack{
                        Text("Age")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                        
                        Spacer()
                        
                        Image(systemName: "sun.min.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    }
                        Text(age)
                            .foregroundStyle(.greenApp)
                            .font(.system(size: 28))
                    
                    
                }
                .padding()
                .background(Color.white.opacity(0.05).cornerRadius(32))
                
                //MARK: - Experience
                VStack{
                    HStack{
                        Text("Experience")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                        
                        Spacer()
                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    }
                    Text(experience)
                            .foregroundStyle(.greenApp)
                            .font(.system(size: 28))
                    
                    
                }
                .padding()
                .background(Color.white.opacity(0.05).cornerRadius(32))
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.05).cornerRadius(32))
    }
}

#Preview {
    ZStack {
        Color.main
        PlayerInfoView()
    }
}
