//
//  HomeModel.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 18/11/2022.
//

import UIKit

class HomeModel: NSObject, NSCoding{
    
    var cancelledShipments : Int!
    var paidInvoiceCount : Int!
    var processingShipments : Int!
    var receivedShipments : Int!
    var recentSearch : [RecentSearch]!
    var shippedShipments : Int!
    var unpaidInvoiceCount : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        cancelledShipments = dictionary["cancelledShipments"] as? Int
        paidInvoiceCount = dictionary["paidInvoiceCount"] as? Int
        processingShipments = dictionary["processingShipments"] as? Int
        receivedShipments = dictionary["receivedShipments"] as? Int
        recentSearch = [RecentSearch]()
        if let recentSearchArray = dictionary["recentSearch"] as? [[String:Any]]{
            for dic in recentSearchArray{
                let value = RecentSearch(fromDictionary: dic)
                recentSearch.append(value)
            }
        }
        shippedShipments = dictionary["shippedShipments"] as? Int
        unpaidInvoiceCount = dictionary["unpaidInvoiceCount"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if cancelledShipments != nil{
            dictionary["cancelledShipments"] = cancelledShipments
        }
        if paidInvoiceCount != nil{
            dictionary["paidInvoiceCount"] = paidInvoiceCount
        }
        if processingShipments != nil{
            dictionary["processingShipments"] = processingShipments
        }
        if receivedShipments != nil{
            dictionary["receivedShipments"] = receivedShipments
        }
        if recentSearch != nil{
            var dictionaryElements = [[String:Any]]()
            for recentSearchElement in recentSearch {
                dictionaryElements.append(recentSearchElement.toDictionary())
            }
            dictionary["recentSearch"] = dictionaryElements
        }
        if shippedShipments != nil{
            dictionary["shippedShipments"] = shippedShipments
        }
        if unpaidInvoiceCount != nil{
            dictionary["unpaidInvoiceCount"] = unpaidInvoiceCount
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         cancelledShipments = aDecoder.decodeObject(forKey: "cancelledShipments") as? Int
         paidInvoiceCount = aDecoder.decodeObject(forKey: "paidInvoiceCount") as? Int
         processingShipments = aDecoder.decodeObject(forKey: "processingShipments") as? Int
         receivedShipments = aDecoder.decodeObject(forKey: "receivedShipments") as? Int
         recentSearch = aDecoder.decodeObject(forKey :"recentSearch") as? [RecentSearch]
         shippedShipments = aDecoder.decodeObject(forKey: "shippedShipments") as? Int
         unpaidInvoiceCount = aDecoder.decodeObject(forKey: "unpaidInvoiceCount") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if cancelledShipments != nil{
            aCoder.encode(cancelledShipments, forKey: "cancelledShipments")
        }
        if paidInvoiceCount != nil{
            aCoder.encode(paidInvoiceCount, forKey: "paidInvoiceCount")
        }
        if processingShipments != nil{
            aCoder.encode(processingShipments, forKey: "processingShipments")
        }
        if receivedShipments != nil{
            aCoder.encode(receivedShipments, forKey: "receivedShipments")
        }
        if recentSearch != nil{
            aCoder.encode(recentSearch, forKey: "recentSearch")
        }
        if shippedShipments != nil{
            aCoder.encode(shippedShipments, forKey: "shippedShipments")
        }
        if unpaidInvoiceCount != nil{
            aCoder.encode(unpaidInvoiceCount, forKey: "unpaidInvoiceCount")
        }

    }

}

class RecentSearch : NSObject, NSCoding{

    var amount : AnyObject!
    var carriageValue : String!
    var consigneeAddress : String!
    var consigneeCity : String!
    var consigneeCountry : String!
    var consigneeName : String!
    var consigneePhone : String!
    var consigneeState : String!
    var deliveryType : String!
    var expectedDeliveryDate : AnyObject!
    var height : String!
    var id : String!
    var itemDescription : String!
    var length : String!
    var packageType : AnyObject!
    var packageWeight : String!
    var pickupLocation : String!
    var quantity : String!
    var requestInsurance : String!
    var requestPickup : String!
    var shipmentDate : String!
    var shipmentFrom : String!
    var shipmentStatus : String!
    var shipmentTo : String!
    var shipmentType : String!
    var shipperAddress : String!
    var shipperCity : String!
    var shipperName : String!
    var shipperPhone : String!
    var shipperState : String!
    var trackNumber : String!
    var userId : String!
    var width : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        amount = dictionary["amount"] as? AnyObject
        carriageValue = dictionary["carriage_value"] as? String
        consigneeAddress = dictionary["consignee_address"] as? String
        consigneeCity = dictionary["consignee_city"] as? String
        consigneeCountry = dictionary["consignee_country"] as? String
        consigneeName = dictionary["consignee_name"] as? String
        consigneePhone = dictionary["consignee_phone"] as? String
        consigneeState = dictionary["consignee_state"] as? String
        deliveryType = dictionary["delivery_type"] as? String
        expectedDeliveryDate = dictionary["expected_delivery_date"] as? AnyObject
        height = dictionary["height"] as? String
        id = dictionary["id"] as? String
        itemDescription = dictionary["item_description"] as? String
        length = dictionary["length"] as? String
        packageType = dictionary["package_type"] as? AnyObject
        packageWeight = dictionary["package_weight"] as? String
        pickupLocation = dictionary["pickup_location"] as? String
        quantity = dictionary["quantity"] as? String
        requestInsurance = dictionary["request_insurance"] as? String
        requestPickup = dictionary["request_pickup"] as? String
        shipmentDate = dictionary["shipment_date"] as? String
        shipmentFrom = dictionary["shipment_from"] as? String
        shipmentStatus = dictionary["shipment_status"] as? String
        shipmentTo = dictionary["shipment_to"] as? String
        shipmentType = dictionary["shipment_type"] as? String
        shipperAddress = dictionary["shipper_address"] as? String
        shipperCity = dictionary["shipper_city"] as? String
        shipperName = dictionary["shipper_name"] as? String
        shipperPhone = dictionary["shipper_phone"] as? String
        shipperState = dictionary["shipper_state"] as? String
        trackNumber = dictionary["track_number"] as? String
        userId = dictionary["user_id"] as? String
        width = dictionary["width"] as? String
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
        if carriageValue != nil{
            dictionary["carriage_value"] = carriageValue
        }
        if consigneeAddress != nil{
            dictionary["consignee_address"] = consigneeAddress
        }
        if consigneeCity != nil{
            dictionary["consignee_city"] = consigneeCity
        }
        if consigneeCountry != nil{
            dictionary["consignee_country"] = consigneeCountry
        }
        if consigneeName != nil{
            dictionary["consignee_name"] = consigneeName
        }
        if consigneePhone != nil{
            dictionary["consignee_phone"] = consigneePhone
        }
        if consigneeState != nil{
            dictionary["consignee_state"] = consigneeState
        }
        if deliveryType != nil{
            dictionary["delivery_type"] = deliveryType
        }
        if expectedDeliveryDate != nil{
            dictionary["expected_delivery_date"] = expectedDeliveryDate
        }
        if height != nil{
            dictionary["height"] = height
        }
        if id != nil{
            dictionary["id"] = id
        }
        if itemDescription != nil{
            dictionary["item_description"] = itemDescription
        }
        if length != nil{
            dictionary["length"] = length
        }
        if packageType != nil{
            dictionary["package_type"] = packageType
        }
        if packageWeight != nil{
            dictionary["package_weight"] = packageWeight
        }
        if pickupLocation != nil{
            dictionary["pickup_location"] = pickupLocation
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        if requestInsurance != nil{
            dictionary["request_insurance"] = requestInsurance
        }
        if requestPickup != nil{
            dictionary["request_pickup"] = requestPickup
        }
        if shipmentDate != nil{
            dictionary["shipment_date"] = shipmentDate
        }
        if shipmentFrom != nil{
            dictionary["shipment_from"] = shipmentFrom
        }
        if shipmentStatus != nil{
            dictionary["shipment_status"] = shipmentStatus
        }
        if shipmentTo != nil{
            dictionary["shipment_to"] = shipmentTo
        }
        if shipmentType != nil{
            dictionary["shipment_type"] = shipmentType
        }
        if shipperAddress != nil{
            dictionary["shipper_address"] = shipperAddress
        }
        if shipperCity != nil{
            dictionary["shipper_city"] = shipperCity
        }
        if shipperName != nil{
            dictionary["shipper_name"] = shipperName
        }
        if shipperPhone != nil{
            dictionary["shipper_phone"] = shipperPhone
        }
        if shipperState != nil{
            dictionary["shipper_state"] = shipperState
        }
        if trackNumber != nil{
            dictionary["track_number"] = trackNumber
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         amount = aDecoder.decodeObject(forKey: "amount") as? AnyObject
         carriageValue = aDecoder.decodeObject(forKey: "carriage_value") as? String
         consigneeAddress = aDecoder.decodeObject(forKey: "consignee_address") as? String
         consigneeCity = aDecoder.decodeObject(forKey: "consignee_city") as? String
         consigneeCountry = aDecoder.decodeObject(forKey: "consignee_country") as? String
         consigneeName = aDecoder.decodeObject(forKey: "consignee_name") as? String
         consigneePhone = aDecoder.decodeObject(forKey: "consignee_phone") as? String
         consigneeState = aDecoder.decodeObject(forKey: "consignee_state") as? String
         deliveryType = aDecoder.decodeObject(forKey: "delivery_type") as? String
         expectedDeliveryDate = aDecoder.decodeObject(forKey: "expected_delivery_date") as? AnyObject
         height = aDecoder.decodeObject(forKey: "height") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         itemDescription = aDecoder.decodeObject(forKey: "item_description") as? String
         length = aDecoder.decodeObject(forKey: "length") as? String
         packageType = aDecoder.decodeObject(forKey: "package_type") as? AnyObject
         packageWeight = aDecoder.decodeObject(forKey: "package_weight") as? String
         pickupLocation = aDecoder.decodeObject(forKey: "pickup_location") as? String
         quantity = aDecoder.decodeObject(forKey: "quantity") as? String
         requestInsurance = aDecoder.decodeObject(forKey: "request_insurance") as? String
         requestPickup = aDecoder.decodeObject(forKey: "request_pickup") as? String
         shipmentDate = aDecoder.decodeObject(forKey: "shipment_date") as? String
         shipmentFrom = aDecoder.decodeObject(forKey: "shipment_from") as? String
         shipmentStatus = aDecoder.decodeObject(forKey: "shipment_status") as? String
         shipmentTo = aDecoder.decodeObject(forKey: "shipment_to") as? String
         shipmentType = aDecoder.decodeObject(forKey: "shipment_type") as? String
         shipperAddress = aDecoder.decodeObject(forKey: "shipper_address") as? String
         shipperCity = aDecoder.decodeObject(forKey: "shipper_city") as? String
         shipperName = aDecoder.decodeObject(forKey: "shipper_name") as? String
         shipperPhone = aDecoder.decodeObject(forKey: "shipper_phone") as? String
         shipperState = aDecoder.decodeObject(forKey: "shipper_state") as? String
         trackNumber = aDecoder.decodeObject(forKey: "track_number") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String
         width = aDecoder.decodeObject(forKey: "width") as? String

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
        if carriageValue != nil{
            aCoder.encode(carriageValue, forKey: "carriage_value")
        }
        if consigneeAddress != nil{
            aCoder.encode(consigneeAddress, forKey: "consignee_address")
        }
        if consigneeCity != nil{
            aCoder.encode(consigneeCity, forKey: "consignee_city")
        }
        if consigneeCountry != nil{
            aCoder.encode(consigneeCountry, forKey: "consignee_country")
        }
        if consigneeName != nil{
            aCoder.encode(consigneeName, forKey: "consignee_name")
        }
        if consigneePhone != nil{
            aCoder.encode(consigneePhone, forKey: "consignee_phone")
        }
        if consigneeState != nil{
            aCoder.encode(consigneeState, forKey: "consignee_state")
        }
        if deliveryType != nil{
            aCoder.encode(deliveryType, forKey: "delivery_type")
        }
        if expectedDeliveryDate != nil{
            aCoder.encode(expectedDeliveryDate, forKey: "expected_delivery_date")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if itemDescription != nil{
            aCoder.encode(itemDescription, forKey: "item_description")
        }
        if length != nil{
            aCoder.encode(length, forKey: "length")
        }
        if packageType != nil{
            aCoder.encode(packageType, forKey: "package_type")
        }
        if packageWeight != nil{
            aCoder.encode(packageWeight, forKey: "package_weight")
        }
        if pickupLocation != nil{
            aCoder.encode(pickupLocation, forKey: "pickup_location")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
        if requestInsurance != nil{
            aCoder.encode(requestInsurance, forKey: "request_insurance")
        }
        if requestPickup != nil{
            aCoder.encode(requestPickup, forKey: "request_pickup")
        }
        if shipmentDate != nil{
            aCoder.encode(shipmentDate, forKey: "shipment_date")
        }
        if shipmentFrom != nil{
            aCoder.encode(shipmentFrom, forKey: "shipment_from")
        }
        if shipmentStatus != nil{
            aCoder.encode(shipmentStatus, forKey: "shipment_status")
        }
        if shipmentTo != nil{
            aCoder.encode(shipmentTo, forKey: "shipment_to")
        }
        if shipmentType != nil{
            aCoder.encode(shipmentType, forKey: "shipment_type")
        }
        if shipperAddress != nil{
            aCoder.encode(shipperAddress, forKey: "shipper_address")
        }
        if shipperCity != nil{
            aCoder.encode(shipperCity, forKey: "shipper_city")
        }
        if shipperName != nil{
            aCoder.encode(shipperName, forKey: "shipper_name")
        }
        if shipperPhone != nil{
            aCoder.encode(shipperPhone, forKey: "shipper_phone")
        }
        if shipperState != nil{
            aCoder.encode(shipperState, forKey: "shipper_state")
        }
        if trackNumber != nil{
            aCoder.encode(trackNumber, forKey: "track_number")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }

    }

}
