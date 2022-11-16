//
//  ShipmentModel.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit

class ShipmentModel: NSObject, NSCoding{
    
    var consigneeName : String!
    var consigneePhone : String!
    var itemDescription : String!
    var shipmentFrom : String!
    var shipmentStatus : String!
    var shipmentTo : String!
    var shipmentType : String!
    var shipmentDate : String!
    var trackNumber : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        consigneeName = dictionary["consignee_name"] as? String
        consigneePhone = dictionary["consignee_phone"] as? String
        itemDescription = dictionary["item_description"] as? String
        shipmentFrom = dictionary["shipmentFrom"] as? String
        shipmentStatus = dictionary["shipmentStatus"] as? String
        shipmentTo = dictionary["shipmentTo"] as? String
        shipmentType = dictionary["shipmentType"] as? String
        shipmentDate = dictionary["shipment_date"] as? String
        trackNumber = dictionary["track_number"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if consigneeName != nil{
            dictionary["consignee_name"] = consigneeName
        }
        if consigneePhone != nil{
            dictionary["consignee_phone"] = consigneePhone
        }
        if itemDescription != nil{
            dictionary["item_description"] = itemDescription
        }
        if shipmentFrom != nil{
            dictionary["shipmentFrom"] = shipmentFrom
        }
        if shipmentStatus != nil{
            dictionary["shipmentStatus"] = shipmentStatus
        }
        if shipmentTo != nil{
            dictionary["shipmentTo"] = shipmentTo
        }
        if shipmentType != nil{
            dictionary["shipmentType"] = shipmentType
        }
        if shipmentDate != nil{
            dictionary["shipment_date"] = shipmentDate
        }
        if trackNumber != nil{
            dictionary["track_number"] = trackNumber
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         consigneeName = aDecoder.decodeObject(forKey: "consignee_name") as? String
         consigneePhone = aDecoder.decodeObject(forKey: "consignee_phone") as? String
         itemDescription = aDecoder.decodeObject(forKey: "item_description") as? String
         shipmentFrom = aDecoder.decodeObject(forKey: "shipmentFrom") as? String
         shipmentStatus = aDecoder.decodeObject(forKey: "shipmentStatus") as? String
         shipmentTo = aDecoder.decodeObject(forKey: "shipmentTo") as? String
         shipmentType = aDecoder.decodeObject(forKey: "shipmentType") as? String
         shipmentDate = aDecoder.decodeObject(forKey: "shipment_date") as? String
         trackNumber = aDecoder.decodeObject(forKey: "track_number") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if consigneeName != nil{
            aCoder.encode(consigneeName, forKey: "consignee_name")
        }
        if consigneePhone != nil{
            aCoder.encode(consigneePhone, forKey: "consignee_phone")
        }
        if itemDescription != nil{
            aCoder.encode(itemDescription, forKey: "item_description")
        }
        if shipmentFrom != nil{
            aCoder.encode(shipmentFrom, forKey: "shipmentFrom")
        }
        if shipmentStatus != nil{
            aCoder.encode(shipmentStatus, forKey: "shipmentStatus")
        }
        if shipmentTo != nil{
            aCoder.encode(shipmentTo, forKey: "shipmentTo")
        }
        if shipmentType != nil{
            aCoder.encode(shipmentType, forKey: "shipmentType")
        }
        if shipmentDate != nil{
            aCoder.encode(shipmentDate, forKey: "shipment_date")
        }
        if trackNumber != nil{
            aCoder.encode(trackNumber, forKey: "track_number")
        }

    }

}
