//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class TravellerViewController: UIViewController {
    
    var location: String?
    var preference: String?
    var message: String?
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var matchLabel: UILabel!
    
   
    
    @IBAction func newYorkDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.NewYork.rawValue, forKey: "City")
    }
    
    
    
    @IBAction func seattleDestination(sender: AnyObject) {
        userDefaults.setValue(Destination.Seattle.rawValue, forKey: "City")
        }
    }
    

    
    @IBAction func bostonDestination(sender: AnyObject) {
        
    }

    @IBAction func austinDestination(sender: AnyObject) {
        
    }
    
    @IBAction func chicagoDestination(sender: AnyObject) {
       
    }
    
    @IBAction func adventurerPreference(sender: AnyObject) {
       
        
    }
    
    @IBAction func cultureExplorerPreference(sender: AnyObject) {
        
    }
    
    @IBAction func historyBuffPreference(sender: AnyObject) {
        
    }
    
    @IBAction func artDesignLoverPreference(sender: AnyObject) {
        
    }
    
    @IBAction func foodiePreference(sender: AnyObject) {
        
    }
    
    @IBAction func nightOwlPreference(sender: AnyObject) {
        
    }
    
    
    @IBAction func submitMatch(sender: AnyObject) {
        if let location = userDefaults.stringForKey("City"){
            let message = matchTravellerWithLocal(location)
            userDefaults.setValue(message, forKey: "Message")
        }
        if let result = userDefaults.stringForKey("Message"){
            matchLabel.text = result
        }
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
        for (local, information) in locals{
            if let city = information["City"]{
                if city == location{
                    message = "Meet \(local), a local of \(city)"
                }
            }
        }
        if message == " "{
            message = "Apologies, there are not any locals in \(location) on LocalRetreat. Try again soon!"
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
    
   
    

