//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class TravellerViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var matchLabel: UILabel!
    
    @IBAction func newYorkDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.NewYork.rawValue, forKey: "City")
    }
    
    @IBAction func sanFranDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.SanFrancisco.rawValue, forKey: "City")
    }
    
    @IBAction func seattleDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.Seattle.rawValue, forKey: "City")
    }

    @IBAction func bostonDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.Boston.rawValue, forKey: "City")
    }
    
    @IBAction func austinDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.Austin.rawValue, forKey: "City")
    }
    
    @IBAction func chicagoDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.Chicago.rawValue, forKey: "City")
    }
    
    @IBAction func adventurerPreference(sender: AnyObject) {
      userDefaults.setValue(TravellingPreference.Adventurer.rawValue, forKey: "Preference")
    }
    
    @IBAction func cultureExplorerPreference(sender: AnyObject) {
        userDefaults.setValue(TravellingPreference.CulturalExplorer.rawValue, forKey: "Preference")
    }
    
    @IBAction func historyBuffPreference(sender: AnyObject) {
        userDefaults.setValue(TravellingPreference.HistoryBuff.rawValue, forKey: "Preference")
    }
    
    @IBAction func artDesignLoverPreference(sender: AnyObject) {
        userDefaults.setValue(TravellingPreference.ArtDesignLover.rawValue, forKey: "Preference")
    }
    
    @IBAction func foodiePreference(sender: AnyObject) {
        userDefaults.setValue(TravellingPreference.Foodie.rawValue, forKey: "Preference")
    }
    
    @IBAction func nightOwlPreference(sender: AnyObject) {
       userDefaults.setValue(TravellingPreference.NightOwl.rawValue, forKey: "Preference")
    }
    
    @IBAction func submitMatch(sender: AnyObject) {
        if let location = userDefaults.stringForKey("City") {
            if let preference = userDefaults.stringForKey("Preference"){
                let message = matchTravellerWithLocal(location, preference: preference)
                userDefaults.setValue(message, forKey: "Message")
            }
        }
    }
    
    @IBAction func matchLocal(sender: AnyObject) {
        matchLabel.text = userDefaults.stringForKey("Message")
    }
    
    func matchTravellerWithLocal(location:String, preference: String) -> String{
        var message = " "
        let locals = LocalsInformation().locals
        for (local, information) in locals{
            if let city = information["City"]{
                if city == location{
                    message = "Meet \(local), a local of \(city)"
                }
            }
            if let type = information["Preference"]{
                if type == preference && message != " "{
                    message += " who is a \(type)"
                    break
                }
            }
        }
        if message == " "{
            message = "Apologies, there are not any locals in \(location) on LocalRetreat. Try again soon!"
            }
        
        return message
    }
    
}
    
   
    

