//
//  HomeAPI.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import Foundation

struct HomeAPI {

    var data : APIData!
    var message : String!
    var statusCode : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let dataData = dictionary["data"] as? [String:Any]{
                data = APIData(fromDictionary: dataData)
            }
        message = dictionary["message"] as? String
        statusCode = dictionary["status_code"] as? Int
    }

}

struct APIData{

    var attractions : [Data]!
    var events : [Data]!
    var hotSpots : [Data]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        attractions = [Data]()
        if let attractionsArray = dictionary["attractions"] as? [[String:Any]]{
            for dic in attractionsArray{
                let value = Data(fromDictionary: dic)
                attractions.append(value)
            }
        }
        events = [Data]()
        if let eventsArray = dictionary["events"] as? [[String:Any]]{
            for dic in eventsArray{
                let value = Data(fromDictionary: dic)
                events.append(value)
            }
        }
        hotSpots = [Data]()
        if let hotSpotsArray = dictionary["hot_spots"] as? [[String:Any]]{
            for dic in hotSpotsArray{
                let value = Data(fromDictionary: dic)
                hotSpots.append(value)
            }
        }
    }
}

struct Data: CellData {
        
    var descriptionField: String!
    var name: String!
    var photos : [String]! 
  
    init(fromDictionary dictionary: [String:Any]){
        descriptionField = dictionary["description"] as? String
        name = dictionary["name"] as? String
        photos = dictionary["photos"] as? [String]
    }
}

