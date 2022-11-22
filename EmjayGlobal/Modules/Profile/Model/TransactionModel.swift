//
//  TransactionModel.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 17/11/2022.
//

import UIKit

class TransactionModel: NSObject, NSCoding{
    
    var amount : String!
    var arrivalDate : String!
    var consigneeAddress : String!
    var consigneeName : String!
    var departureDate : String!
    var qrImage : String!
    var shipmentFrom : String!
    var shipmentTo : String!
    var trackNumber : String!
    var trnasitTime : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        amount = dictionary["amount"] as? String ?? "0.0"
        arrivalDate = dictionary["arrival_date"] as? String
        consigneeAddress = dictionary["consignee_address"] as? String
        consigneeName = dictionary["consignee_name"] as? String
        departureDate = dictionary["departure_date"] as? String
        qrImage = dictionary["qr_image"] as? String
        shipmentFrom = dictionary["shipment_from"] as? String
        shipmentTo = dictionary["shipment_to"] as? String
        trackNumber = dictionary["track_number"] as? String
        trnasitTime = dictionary["trnasit_time"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if amount != nil{
            dictionary["amount"] = amount
        }
        if arrivalDate != nil{
            dictionary["arrival_date"] = arrivalDate
        }
        if consigneeAddress != nil{
            dictionary["consignee_address"] = consigneeAddress
        }
        if consigneeName != nil{
            dictionary["consignee_name"] = consigneeName
        }
        if departureDate != nil{
            dictionary["departure_date"] = departureDate
        }
        if qrImage != nil{
            dictionary["qr_image"] = qrImage
        }
        if shipmentFrom != nil{
            dictionary["shipment_from"] = shipmentFrom
        }
        if shipmentTo != nil{
            dictionary["shipment_to"] = shipmentTo
        }
        if trackNumber != nil{
            dictionary["track_number"] = trackNumber
        }
        if trnasitTime != nil{
            dictionary["trnasit_time"] = trnasitTime
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         amount = aDecoder.decodeObject(forKey: "amount") as? String
         arrivalDate = aDecoder.decodeObject(forKey: "arrival_date") as? String
         consigneeAddress = aDecoder.decodeObject(forKey: "consignee_address") as? String
         consigneeName = aDecoder.decodeObject(forKey: "consignee_name") as? String
         departureDate = aDecoder.decodeObject(forKey: "departure_date") as? String
         qrImage = aDecoder.decodeObject(forKey: "qr_image") as? String
         shipmentFrom = aDecoder.decodeObject(forKey: "shipment_from") as? String
         shipmentTo = aDecoder.decodeObject(forKey: "shipment_to") as? String
         trackNumber = aDecoder.decodeObject(forKey: "track_number") as? String
         trnasitTime = aDecoder.decodeObject(forKey: "trnasit_time") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if amount != nil{
            aCoder.encode(amount, forKey: "amount")
        }
        if arrivalDate != nil{
            aCoder.encode(arrivalDate, forKey: "arrival_date")
        }
        if consigneeAddress != nil{
            aCoder.encode(consigneeAddress, forKey: "consignee_address")
        }
        if consigneeName != nil{
            aCoder.encode(consigneeName, forKey: "consignee_name")
        }
        if departureDate != nil{
            aCoder.encode(departureDate, forKey: "departure_date")
        }
        if qrImage != nil{
            aCoder.encode(qrImage, forKey: "qr_image")
        }
        if shipmentFrom != nil{
            aCoder.encode(shipmentFrom, forKey: "shipment_from")
        }
        if shipmentTo != nil{
            aCoder.encode(shipmentTo, forKey: "shipment_to")
        }
        if trackNumber != nil{
            aCoder.encode(trackNumber, forKey: "track_number")
        }
        if trnasitTime != nil{
            aCoder.encode(trnasitTime, forKey: "trnasit_time")
        }

    }

}
