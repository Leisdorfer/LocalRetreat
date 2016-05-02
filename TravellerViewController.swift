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
        matchLocalLabel.hidden = true
        let randomImageNumber = arc4random_uniform(4)+1
        if userDefaults.stringForKey("Gender") == Gender.Female.rawValue{
            let femaleImage = String(format: "Female%i", randomImageNumber)
            self.localImages.image = UIImage(named: femaleImage)
        }else if userDefaults.stringForKey("Gender") == Gender.Male.rawValue{
            let maleImage = String(format: "Male%i", randomImageNumber)
            self.localImages.image = UIImage(named: maleImage)
        }
        
    }
    @IBOutlet weak var matchLocalLabel: UIButton!
    
    @IBOutlet weak var localImages: UIImageView!
    
    func matchTravellerWithLocal(location:String, preference: String) -> String{
        var message = " "
        let locals = LocalsInformation().locals
        for (local, information) in locals{
            if let city = information["City"]{
                if city == location{
                    message = "Meet \(local), a local of \(city)"
                    if information["Gender"] == Gender.Female.rawValue{
                        userDefaults.setValue(Gender.Female.rawValue, forKey: "Gender")
                    }else{
                        userDefaults.setValue(Gender.Male.rawValue, forKey: "Gender")
                    }
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
    
   
    

