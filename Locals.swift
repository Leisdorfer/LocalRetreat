//
//  Locals.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import Foundation

struct LocalsInformation{
    let locals: [String: Dictionary<String, String>] = ["Jerry":["City":Destination.Seattle.rawValue,"Preference": TravellingPreference.Adventurer.rawValue, "Gender": Gender.Male.rawValue],"Beth":["City":Destination.Seattle.rawValue,"Preference":TravellingPreference.Foodie.rawValue, "Gender": Gender.Female.rawValue],"Emily":["City":Destination.Boston.rawValue,"Preference":TravellingPreference.HistoryBuff.rawValue, "Gender": Gender.Female.rawValue],"Eric":["City":Destination.Boston.rawValue,"Preference": TravellingPreference.ArtDesignLover.rawValue, "Gender": Gender.Male.rawValue],"Paul":["City": Destination.Chicago.rawValue, "Preference":TravellingPreference.CulturalExplorer.rawValue, "Gender": Gender.Male.rawValue],"Leslie":["City":Destination.Chicago.rawValue,"Preference":TravellingPreference.NightOwl.rawValue, "Gender": Gender.Female.rawValue],"Rachel":["City": Destination.SanFrancisco.rawValue,"Preference":TravellingPreference.Foodie.rawValue, "Gender":Gender.Female.rawValue],"Kavon":["City":Destination.SanFrancisco.rawValue,"Preference":TravellingPreference.Adventurer.rawValue, "Gender":Gender.Male.rawValue],"Lauren":["City":Destination.NewYork.rawValue,"Preference": TravellingPreference.HistoryBuff.rawValue, "Gender": Gender.Female.rawValue],"Ben":["City":Destination.NewYork.rawValue, "Preference":TravellingPreference.ArtDesignLover.rawValue, "Gender": Gender.Male.rawValue],"Rebecca":["City":Destination.Austin.rawValue,"Preference":TravellingPreference.CulturalExplorer.rawValue, "Gender":Gender.Female.rawValue],"Susie":["City":Destination.Austin.rawValue,"Preference":TravellingPreference.NightOwl.rawValue, "Gender": Gender.Female.rawValue] ]
}

enum Gender: String{
    case Female
    case Male
}