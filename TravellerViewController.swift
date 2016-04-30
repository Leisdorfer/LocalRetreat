//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class TravellerViewController: UIViewController {
    
    var location: Destination!
    var preference: TravellingPreference!
    
    
    @IBAction func newYorkDestination(sender: AnyObject) {
        location = Destination.NewYork
       /* do{
            let line = try matchTravellerWithLocal()
            print(line)
        } catch Errors.InvalidPath{
            print("Invalid Path")
        } catch let error{
            fatalError("\(error)")
        }
        
    }*/
    
    @IBAction func seattleDestination(sender: AnyObject) {
        location = Destination.Seattle
    }
    
    @IBAction func sanFranDestination(sender: AnyObject) {
        location = Destination.SanFrancisco
    }
    
    @IBAction func bostonDestination(sender: AnyObject) {
        location = Destination.Boston
    }
    
    @IBAction func austinDestination(sender: AnyObject) {
        location = Destination.Austin
    }
    
    @IBAction func chicagoDestination(sender: AnyObject) {
        location = Destination.Chicago
    }
    
    @IBAction func adventurerPreference(sender: AnyObject) {
        preference = TravellingPreference.Adventurer
        print(preference)
    }
    
    @IBAction func cultureExplorerPreference(sender: AnyObject) {
        preference = TravellingPreference.CulturalExplorer
    }
    
    @IBAction func historyBuffPreference(sender: AnyObject) {
        preference = TravellingPreference.HistoryBuff
    }
    
    @IBAction func artDesignLoverPreference(sender: AnyObject) {
        preference = TravellingPreference.ArtDesignLover
    }
    
    @IBAction func foodiePreference(sender: AnyObject) {
        preference = TravellingPreference.Foodie
    }
    
    @IBAction func nightOwlPreference(sender: AnyObject) {
        preference = TravellingPreference.NightOwl
    }
    
  var traveller: Traveller{
        return Traveller(destination: location, travellingPreference: preference)
    }
    
  /*  func matchTravellerWithLocal() throws -> String{

        
        guard let path = NSBundle.mainBundle().pathForResource("Locals", ofType: "plist") else{
            throw Errors.InvalidPath
        }
        return path
       
 
    }*/
    
  /*  func matchTraveller(location: Destination, preference: TravellingPreference) -> String{
        var message = ""
        if let path = NSBundle.mainBundle().pathForResource("Locals", ofType: "plist"){
            if let map = NSDictionary(contentsOfFile: path){
                if let locals = map["Local"] as? String {
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

   
    

