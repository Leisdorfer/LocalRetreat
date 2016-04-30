//
//  Traveller.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import Foundation


protocol TravellerType{
    var destination: [Destination] {get}
    var travellingPreference: [TravellingPreference] {get}
}

enum Destination: String {
    case NewYork
    case Seattle
    case SanFrancisco
    case Boston
    case Austin
    case Chicago
}

enum TravellingPreference {
    case Adventurer
    case ArtDesignLover
    case Foodie
    case CulturalExplorer
    case HistoryBuff
    case NightOwl
}

class Traveller: TravellerType{
   var destination: [Destination]
   var travellingPreference: [TravellingPreference]
    init(destination: [Destination], travellingPreference: [TravellingPreference]){
        self.destination = destination
        self.travellingPreference = travellingPreference
    }
}