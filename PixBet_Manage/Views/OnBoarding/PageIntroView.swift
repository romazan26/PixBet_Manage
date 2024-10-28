//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .bottom) {
            VStack {
                
                
                Image(page.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
                        
 
    }
}


#Preview {
    ZStack {
        Color.black
        PageIntroView(page: PageIntro.samplePage)
    }
}
