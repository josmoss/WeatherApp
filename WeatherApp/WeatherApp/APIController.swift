//
//  APIController.swift
//  WeatherApp
//
//  Created by Joe Moss on 6/23/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    // Create a sesison constant
    let session = NSURLSession.sharedSession()
    
//    weak var delegate: WeatherAPIDelegate?
    
    // Fetch the weather data from the web API
    func fetchWeather(location: String) {
        
        // Insert the URLString for the API call
        let urlString = ""
        
        print(urlString)
        
        
    }
    
    func parseJSON(data: NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        
        if let data = data {
            do {
                
                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    theDictionary = jsonDictionary
                    //print(jsonDictionary)
                    
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
            } catch {
            }
        } else {
            print("Could not unwrap data")
        }
        return theDictionary
    }

}
