//
//  cityDetailView.swift
//  travelCheck
//
//  Created by Ahmet Mert ÖZ on 4.06.2022.
//

import SwiftUI

struct cityDetailView: View {
    
    var chosenTravel : cityModel
    @State var seen : Bool = false
    
    var body: some View {
        VStack{
            Text(chosenTravel.description)
                .padding()
            Text(chosenTravel.name)
                .padding()
                .foregroundColor(seen ? .blue : .black)
            
            SeenButton(seenOrNot: $seen)

        }
    }
}

struct cityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        cityDetailView(chosenTravel : cityModel3)
    }
}
