//
//  Traveller.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import Foundation


protocol TravellerType{
    var destination: String {get}
    var travellingPreference: String {get}
    init(destination: String, travellingPreference: String)
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

enum Gender: String{
    case Female
    case Male
}

class Traveller: TravellerType{
   var destination: String
   var travellingPreference: String
    required init(destination: String, travellingPreference: String){
        self.destination = destination
        self.travellingPreference = travellingPreference
    }
}