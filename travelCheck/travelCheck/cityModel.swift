//
//  cityModel.swift
//  travelCheck
//
//  Created by Ahmet Mert ÖZ on 3.06.2022.
//

import SwiftUI

struct cityModel: Identifiable{
    
    var id = UUID()
    var name : String
    var description : String
    
    
}

var cityModel1 = cityModel(name: "bursa", description: "Ulu Sehir")
var cityModel2 = cityModel(name: "izmir", description: "guzel sehir")
var cityModel3 = cityModel(name: "ankara", description: "baskent")

var  travelArray = [cityModel1,cityModel2,cityModel3]

