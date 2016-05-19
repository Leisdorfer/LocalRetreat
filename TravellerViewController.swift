//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit
import MessageUI

class TravellerViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
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
    
    @IBOutlet weak var connectWithLocal: UILabel!
    
    @IBOutlet weak var planWithLocal: UILabel!
    
    @IBOutlet weak var exploreWithLocal: UILabel!
    
    @IBAction func matchLocal(sender: AnyObject) {
        if let location = userDefaults.stringForKey("City") {
            if let preference = userDefaults.stringForKey("Preference"){
                let traveller = Traveller(destination: location, travellingPreference: preference)
                let message = matchTravellerWithLocal(traveller)
                userDefaults.setValue(message, forKey: "Message")
            }
        }
        matchLabel.text = userDefaults.stringForKey("Message")
        matchLocalLabel.hidden = true
        let randomImageNumber = arc4random_uniform(4)+1
        if userDefaults.stringForKey("Gender") == Gender.Female.rawValue{
            let femaleImage = String(format: "Female%i", randomImageNumber)
            localImages.image = UIImage(named: femaleImage)
        }else if userDefaults.stringForKey("Gender") == Gender.Male.rawValue{
            let maleImage = String(format: "Male%i", randomImageNumber)
            localImages.image = UIImage(named: maleImage)
        }
        let name = userDefaults.stringForKey("Name")
        let city = userDefaults.stringForKey("City")
        connectWithLocal.text = "Connect with \(name!) via \(name!)@LocalRetreat"
        planWithLocal.text = "Plan your trip to \(city!) with \(name!)"
        exploreWithLocal.text = "Explore \(city!) with \(name!)"
        emailButton.setTitle("Email \(name!)", forState: UIControlState.Normal)
        emailButton.backgroundColor = UIColor.whiteColor()
    }
    @IBOutlet weak var matchLocalLabel: UIButton!
    
    @IBOutlet weak var localImages: UIImageView!
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBAction func emailLocal(sender: AnyObject) {
        let localEmail = emailLocal()
        if MFMailComposeViewController.canSendMail(){
            self.presentViewController(localEmail, animated: true, completion: nil)
            
        }
    }
    func matchTravellerWithLocal(traveller: Traveller) -> String{
        var message = " "
        for (local) in NSUserDefaults.standardUserDefaults().dictionaryRepresentation() {
            print(local)
            if let information = userDefaults.dictionaryForKey(local.0){
                print("Information: \(information)")
                if let name = information["Name"], let city = information["City"], let gender = information["Gender"]{
                    print(name, city, gender)
                if city as! String == traveller.destination{
                    message = "Meet \(name), a local of \(city) "
                    print(message)
                    userDefaults.setValue(name, forKey: "Name")
                    if gender as! String == Gender.Female.rawValue{
                        userDefaults.setValue(Gender.Female.rawValue, forKey: "Gender")
                    } else{
                        userDefaults.setValue(Gender.Male.rawValue, forKey: "Gender")
                    }
                }
            }
        }
        if let information = userDefaults.dictionaryForKey(local.0), let preference = information["Preference"]{
            if preference as! String == traveller.travellingPreference && message != " "{
                message += "who is a \(preference)"
                break
                }
            }
        }
        
        if message == " "{
            message = "Apologies, there are not any locals in \(traveller.destination) on LocalRetreat. Try again soon!"
        }
        return message
    }
    
    func emailLocal() -> MFMailComposeViewController{
        let name = userDefaults.stringForKey("Name")
        let city = userDefaults.stringForKey("City")
        let localMail = MFMailComposeViewController()
        localMail.mailComposeDelegate = self
        localMail.setToRecipients(["\(name!)@LocalRetreat.com"])
        localMail.setSubject("LocalRetreat Outreach: \(city!)")
        return localMail
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue{
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
    
   
    

