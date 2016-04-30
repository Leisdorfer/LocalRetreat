//
//  DestinationViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 4/30/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class TravellerViewController: UIViewController {
    
    var destination: Destination!
    var preference: TravellingPreference!
    
    @IBAction func newYorkDestination(sender: AnyObject) {
        destination = Destination.NewYork
    }
    
    @IBAction func seattleDestination(sender: AnyObject) {
        destination = Destination.Seattle
    }
    
    @IBAction func sanFranDestination(sender: AnyObject) {
        destination = Destination.SanFrancisco
    }
    
    @IBAction func bostonDestination(sender: AnyObject) {
        destination = Destination.Boston
    }
    
    @IBAction func austinDestination(sender: AnyObject) {
        destination = Destination.Austin
    }
    
    @IBAction func chicagoDestination(sender: AnyObject) {
        destination = Destination.Chicago
    }
    
    
    @IBAction func adventurerPreference(sender: AnyObject) {
        
    }
    
}
