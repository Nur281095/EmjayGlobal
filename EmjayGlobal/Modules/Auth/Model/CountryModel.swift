//
//  CountryModel.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 10/11/2022.
//

import UIKit

class CountryModel: NSObject, NSCoding{
    
    var country : String!
    var countryId : String!
    var id : String!
    var name : String!
    var stateId : String!
    var question : String!
    var isSelected = false


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        country = dictionary["country"] as? String
        question = dictionary["question"] as? String
        countryId = dictionary["country_id"] as? String
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        stateId = dictionary["state_id"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if country != nil{
            dictionary["country"] = country
        }
        if countryId != nil{
            dictionary["country_id"] = countryId
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if stateId != nil{
            dictionary["state_id"] = stateId
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         country = aDecoder.decodeObject(forKey: "country") as? String
         countryId = aDecoder.decodeObject(forKey: "country_id") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         stateId = aDecoder.decodeObject(forKey: "state_id") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if country != nil{
            aCoder.encode(country, forKey: "country")
        }
        if countryId != nil{
            aCoder.encode(countryId, forKey: "country_id")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if stateId != nil{
            aCoder.encode(stateId, forKey: "state_id")
        }

    }

}
