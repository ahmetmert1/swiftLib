//
//  ContentView.swift
//  travelCheck
//
//  Created by Ahmet Mert ÖZ on 3.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var yazi = "Ahmet"
    
    var body: some View {
        
        
        
        VStack{
            Text(yazi)
            Button {
                self.yazi = "Tiklandi"
            } label: {
                Text("Tikla")
                    .padding()
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
