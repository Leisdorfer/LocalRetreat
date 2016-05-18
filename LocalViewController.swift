//
//  LocalViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 5/16/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class LocalViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let citySelected = localInput[0][pickerView.selectedRowInComponent(0)]
        let preferenceSelected = localInput[1][pickerView.selectedRowInComponent(1)]
        if let name = nameTextField.text{
            var localInformation = LocalsInformation().locals
            localInformation[name] = [
                "City": citySelected,
                "Preference": preferenceSelected,
                "Gender": "Female"
            ]
            LocalsInformation().locals[name] = localInformation[name]
        print(localInformation)
        }
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        return true
    }
    
    
}