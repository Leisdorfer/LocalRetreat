//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class TravellerViewController: UIViewController {
    
    var location: String = ""
    var preference: String = ""

    
 
    
    @IBOutlet weak var matchLabel: UILabel!
    
   
    @IBAction func newYorkDestination(sender: AnyObject) {
        location = Destination.NewYork.rawValue
        //  matchLabel.text = matchTravellerWithLocal(location)
    }
    
    
    @IBAction func seattleDestination(sender: AnyObject) {
        location = Destination.Seattle.rawValue
    }
    
    @IBAction func sanFranDestination(sender: AnyObject) {
        location = Destination.SanFrancisco.rawValue
    }
    
    @IBAction func bostonDestination(sender: AnyObject) {
        location = Destination.Boston.rawValue
    }
    
    @IBAction func austinDestination(sender: AnyObject) {
        location = Destination.Austin.rawValue
    }
    
    @IBAction func chicagoDestination(sender: AnyObject) {
        location = Destination.Chicago.rawValue
    }
    
    @IBAction func adventurerPreference(sender: AnyObject) {
       preference = TravellingPreference.Adventurer.rawValue
        
    }
    
    @IBAction func cultureExplorerPreference(sender: AnyObject) {
        preference = TravellingPreference.CulturalExplorer.rawValue
    }
    
    @IBAction func historyBuffPreference(sender: AnyObject) {
        preference = TravellingPreference.HistoryBuff.rawValue
    }
    
    @IBAction func artDesignLoverPreference(sender: AnyObject) {
        preference = TravellingPreference.ArtDesignLover.rawValue
    }
    
    @IBAction func foodiePreference(sender: AnyObject) {
        preference = TravellingPreference.Foodie.rawValue
    }
    
    @IBAction func nightOwlPreference(sender: AnyObject) {
        preference = TravellingPreference.NightOwl.rawValue
    }
    
    
    @IBAction func submitMatch(sender: AnyObject) {
     //   let message = matchTravellerWithLocal(Destination.NewYork.rawValue, type: TravellingPreference.Adventurer.rawValue)
       // matchLabel.text = message
        
    }
   /* var travellerInformation: Traveller{
        return Traveller(destination: location, travellingPreference: preference)
    }
    
    var message: String {
        return (matchTravellerWithLocal(travellerInformation))
    }*/
    
  
    
    /*func matchTravellerWithLocal(location: String, type: String) -> String {
        var message = " "
        let locals = LocalsInformation().locals
        for (name, information) in locals{
            let city = information["City"]
            print(city)
            let preference = information["Preference"]
            if city == location{
                message = "Meet your local: \(name), a local of \(city)"
            }else{
                message = "Apologies, there aren't in \(city) on LocalRetreat. Try again soon!"
                break
            }
            if preference == type{
                message += "who is also a \(preference)"
            }
        }
        return message
    }*/
    
    func matchTravellerWithLocal(location:String) -> String{
        var message = " "
        let locals = LocalsInformation().locals
        /*for (name, information) in locals{
            let city = information["City"]
            if "New York" == location{
                message = "Meet your local: \(name), a local of \(city)"
            }else{
                message = "Apologies, there aren't in \(city) on LocalRetreat. Try again soon!"
                break

            }*/
         if location ==  "New York"{
            message = "We have a match!"
        }
        return message
    }
    /*func matchTraveller(location: Destination, preference: TravellingPreference) -> String{
        var message = ""
        if let path = NSBundle.mainBundle().pathForResource("Locals", ofType: "plist"){
            if let map = NSDictionary(contentsOfFile: path){
                if let locals = map["Local"] as? [String:String] {
                    for local in locals{
                        let city = local["City"]
                        if local["City"] == location {
                            message = "We have matched you with \(local) in \(city)."
                        } else{
                            message = "Apologies, there aren't any locals registered in \(city) on LocalRetreat. Try again soon!"
                            break
                        }
                        if local["Preference"] == preference{
                            let prefer = local["Preference"]
                            message += "\(local) is also a \(prefer)"
                        }
                        return message
                    }
                }
            }
            
        }
    }*/
  
    
}
    
   
    

