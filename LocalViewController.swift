//
//  LocalViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 5/16/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit
import RealmSwift

class LocalViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var preferenceLabel: UILabel!
    @IBOutlet weak var submissionButton: UIButton!
    
    let localContent = NSUserDefaults.standardUserDefaults()
    
    let localInput = [[Destination.Austin.rawValue, Destination.Boston.rawValue, Destination.Chicago.rawValue, Destination.NewYork.rawValue, Destination.SanFrancisco.rawValue, Destination.Seattle.rawValue],[TravellingPreference.Adventurer.rawValue, TravellingPreference.ArtDesignLover.rawValue, TravellingPreference.CulturalExplorer.rawValue, TravellingPreference.Foodie.rawValue, TravellingPreference.HistoryBuff.rawValue, TravellingPreference.NightOwl.rawValue]]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return localInput.count
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return localInput[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return localInput[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let citySelected = localInput[0][pickerView.selectedRowInComponent(0)]
        let preferenceSelected = localInput[1][pickerView.selectedRowInComponent(1)]
        localContent.setValue(usernameTextField.text, forKey: "username")
        localContent.synchronize()
        localContent.removeObjectForKey("")
        //addLocal(citySelected, preference: preferenceSelected)
        if let name = nameTextField.text, let gender = genderTextField.text, let username = usernameTextField.text{
            addLocal(citySelected, preference: preferenceSelected)
            localContent.setValue(["Name": name, "City": citySelected, "Preference": preferenceSelected, "Gender": gender], forKey: username)
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView{
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = localInput[component][row]
        pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitButton(sender: AnyObject) {
        if nameTextField.text == "" ||  genderTextField.text == "" || usernameTextField.text == ""{
            let alert = UIAlertController(title: "Missing Fields", message: "Please enter your name, username, and gender", preferredStyle: UIAlertControllerStyle.Alert)
            let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
        } else{
            welcomeLabel.text = "Thank you for registering as a local on LocalRetreat!"
            nameLabel.hidden = true
            nameTextField.hidden = true
            usernameTextField.hidden = true
            usernameLabel.hidden = true
            usernameTextField.hidden=true
            genderLabel.hidden = true
            genderTextField.hidden=true
            cityLabel.hidden=true
            preferenceLabel.hidden=true
            cityPicker.hidden=true
            submissionButton.hidden=true
        }
    }
    
    func addLocal(city: String, preference: String){
        let local = Local()
        if let name = nameTextField.text{
            local.name = name
        }
        if let username = usernameTextField.text{
            local.username = username
        }
        if let gender = genderTextField.text{
            local.gender = gender
        }
        local.city = city
        local.preference = preference
        let realm = try! Realm()
        try! realm.write{
            realm.add(local)
        }
    }
}