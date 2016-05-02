//
//  Traveller.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import Foundation


protocol TravellerType{
    var destination: Destination {get}
    var travellingPreference: TravellingPreference {get}
    init(destination: Destination, travellingPreference: TravellingPreference)
}

enum Destination: String {
    case NewYork = "New York"
    case Seattle = "Seattle"
    case SanFrancisco = "San Francisco"
    case Boston = "Boston"
    case Austin = "Austin"
    case Chicago = "Chicago"
}

enum TravellingPreference: String{
    case Adventurer = "Adventurer"
    case ArtDesignLover = "Art Design Lover"
    case Foodie = "Foodie"
    case CulturalExplorer = "Cultural Explorer"
    case HistoryBuff = "History Buff"
    case NightOwl = "Night Owl"
}

enum Errors: ErrorType {
    case InvalidPath
}

class Traveller: TravellerType{
   var destination: Destination
   var travellingPreference: TravellingPreference
    required init(destination: Destination, travellingPreference: TravellingPreference){
        self.destination = destination
        self.travellingPreference = travellingPreference
    }
}