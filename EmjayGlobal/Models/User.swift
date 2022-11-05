//
//  User.swift
//  EyecareBrands
//
//  Created by Noblemetric Technology on 9/5/22.
//

import UIKit

class User: NSObject, NSCoding{
    
    var email : String!
    var firstName : String!
    var fullName : String!
    var id : Int!
    var lastName : String!
    var token : String!
    var status : Int!
    var points : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        email = dictionary["email"] as? String
        firstName = dictionary["first_name"] as? String
        fullName = dictionary["full_name"] as? String
        id = dictionary["id"] as? Int
        lastName = dictionary["last_name"] as? String
        token = dictionary["token"] as? String
        status = dictionary["status"] as? Int
        points = dictionary["points"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if email != nil{
            dictionary["email"] = email
        }
        if firstName != nil{
            dictionary["first_name"] = firstName
        }
        if fullName != nil{
            dictionary["full_name"] = fullName
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lastName != nil{
            dictionary["last_name"] = lastName
        }
        if token != nil{
            dictionary["token"] = token
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        email = aDecoder.decodeObject(forKey: "email") as? String
        firstName = aDecoder.decodeObject(forKey: "first_name") as? String
        fullName = aDecoder.decodeObject(forKey: "full_name") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        lastName = aDecoder.decodeObject(forKey: "last_name") as? String
        token = aDecoder.decodeObject(forKey: "token") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "first_name")
        }
        if fullName != nil{
            aCoder.encode(fullName, forKey: "full_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "last_name")
        }
        if token != nil{
            aCoder.encode(lastName, forKey: "token")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        
    }
    
}
