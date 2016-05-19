//
//  LocalViewController.swift
//  LocalRetreat
//
//  Created by Lauren Eisdorfer on 5/16/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit
import CoreData

class LocalViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print(localContent)
        let citySelected = localInput[0][pickerView.selectedRowInComponent(0)]
        let preferenceSelected = localInput[1][pickerView.selectedRowInComponent(1)]
        if let name = nameTextField.text, let gender = genderTextField.text, let username = usernameTextField.text{
           /* var localInformation = LocalsInformation().locals
            localInformation[name] = [
                "City": citySelected,
                "Preference": preferenceSelected,
                "Gender": gender
            ]*/
            
            
          // LocalsInformation().locals[name] = localInformation[name]
            localContent.setValue(["Name": name, "City": citySelected, "Preference": preferenceSelected, "Gender": gender], forKey: username)
            
            for (local) in NSUserDefaults.standardUserDefaults().dictionaryRepresentation() {
                //print(information["City"])
                //if String(information["City"]) == "Chicago"{
                print(local)
                if let information = localContent.dictionaryForKey(username){
                    if information["City"]! as! String == "Boston"{
                        let name = information["Name"]! as! String
                        let gender = information["Gender"]! as! String
                        let preference = information["Preference"]! as! String
                    print(information["City"]!, name, gender, preference)
                    break
                    }
                }
               // print(local[1][0])
              //  print(information)
                
                //}
            }
            if let localName = localContent.objectForKey("Rach") as? [String: String]{
            //print(localName["Preference"]!)
            }
            
            /*let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDel.managedObjectContext
            let newLocal = NSEntityDescription.insertNewObjectForEntityForName("Locals", inManagedObjectContext: context) as NSManagedObject
            newLocal.setValue(name, forKey: "name")
            newLocal.setValue(citySelected, forKey: "city")
            newLocal.setValue(preferenceSelected, forKey: "preference")
            do{
            try context.save()
            } catch {
                print("Unexpected error")
            }
        print(localInformation)*/
             /*var local = [NSManagedObject]()
            
             let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
             let context = appDel.managedObjectContext
             let entity = NSEntityDescription.entityForName("Locals", inManagedObjectContext: context)
             let newLocal = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
             newLocal.setValue(name, forKey: "name")
             newLocal.setValue(citySelected, forKey: "city")
             newLocal.setValue(preferenceSelected, forKey: "preference")
             do{
             try context.save()
             local.append(newLocal)
             } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
             }*/
           //  print(localInformation)
        }
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        return true
    }
    
    
}