//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Joe Moss on 6/23/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit
import CoreLocation


class CitiesTableViewController: UITableViewController {

    let apiController = APIController()
    
    var cityName: String = ""
    var zipcode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.apiController.delegate = self
//        
//        self.apiController.fetchWeather("00.000,-000.0000")

    }
    
    @IBAction func addCityButton(sender: UIBarButtonItem) {
        
        // Create AlertController
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Create the Save Action with textfields
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if let name = firstTextField.text {
                self.cityName = name
            }
            
            if let code = secondTextField.text {
                self.zipcode = code
            }
            
            print(firstTextField.text)
            print(secondTextField.text)
            
            // call geocode
            func geocoding(location: String, completion: (Double, Double) -> ()) {
                CLGeocoder().geocodeAddressString(location) {
                    
                    (placemarks, error) in
                    
                    if placemarks?.count > 0 {
                        let placemark = placemarks?[0]
                        let location = placemark!.location
                        let coordinate = location?.coordinate
                        completion((coordinate?.latitude)!, (coordinate?.longitude)!)
                    }
                }
                
                geocoding("84088") { (lat: Double, long: Double) in
                    
                    print(lat)
                    print(long)
                    
                }
                
                geocoding("84119") { (latitude: Double, longitude: Double) in
                    
                    print(latitude)
                    print(longitude)
                }
                
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter City Name"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Zipcode"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Test"
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    }
    
}