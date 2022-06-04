//
//  SeenButton.swift
//  travelCheck
//
//  Created by Ahmet Mert ÖZ on 4.06.2022.
//

import SwiftUI

struct SeenButton: View {
    
    @Binding var seenOrNot : Bool
    
    var body: some View {
        
        Button {
            
            seenOrNot.toggle()
            
        } label: {
            Text("Seen / Not Seen")
                .padding()
        }
        
    }
}

struct SeenButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("seen")
    }
}
