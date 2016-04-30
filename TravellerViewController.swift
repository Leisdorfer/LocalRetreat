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
    
    @IBAction func newYorkDestination(sender: AnyObject) {
        location = Destination.NewYork
        print(location)
    }
    
    @IBAction func seattleDestination(sender: AnyObject) {
        location = Destination.Seattle
        print(location)
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
    
    
    
}
