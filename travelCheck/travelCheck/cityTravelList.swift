//
//  cityTravelList.swift
//  travelCheck
//
//  Created by Ahmet Mert ÖZ on 3.06.2022.
//

import SwiftUI

struct cityTravelList: View {
    var body: some View {
        
        NavigationView{
        List(travelArray){ travels in
            
            NavigationLink {
                cityDetailView(chosenTravel: travels)
            } label: {
                Text(travels.name)

            }

            
        }
        }

    }
}

struct cityTravelList_Previews: PreviewProvider {
    static var previews: some View {
        cityTravelList()
    }
}
