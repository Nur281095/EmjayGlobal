//
//  InvoiceModel.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit

class InvoiceModel: NSObject, NSCoding{
    
    var error : Bool!
    var openCount : Int!
    var openInvoices : [OpenInvoice]!
    var paidInvoices : [OpenInvoice]!
    var status : Int!
    var totalAmount : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        error = dictionary["error"] as? Bool
        openCount = dictionary["openCount"] as? Int
        openInvoices = [OpenInvoice]()
        if let openInvoicesArray = dictionary["openInvoices"] as? [[String:Any]]{
            for dic in openInvoicesArray{
                let value = OpenInvoice(fromDictionary: dic)
                openInvoices.append(value)
            }
        }
        paidInvoices = [OpenInvoice]()
        if let paidInvoicesArray = dictionary["paidInvoices"] as? [[String:Any]]{
            for dic in paidInvoicesArray{
                let value = OpenInvoice(fromDictionary: dic)
                paidInvoices.append(value)
            }
        }
        status = dictionary["status"] as? Int
        totalAmount = dictionary["totalAmount"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if error != nil{
            dictionary["error"] = error
        }
        if openCount != nil{
            dictionary["openCount"] = openCount
        }
        if openInvoices != nil{
            var dictionaryElements = [[String:Any]]()
            for openInvoicesElement in openInvoices {
                dictionaryElements.append(openInvoicesElement.toDictionary())
            }
            dictionary["openInvoices"] = dictionaryElements
        }
        if paidInvoices != nil{
            var dictionaryElements = [[String:Any]]()
            for paidInvoicesElement in paidInvoices {
                dictionaryElements.append(paidInvoicesElement.toDictionary())
            }
            dictionary["paidInvoices"] = dictionaryElements
        }
        if status != nil{
            dictionary["status"] = status
        }
        if totalAmount != nil{
            dictionary["totalAmount"] = totalAmount
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         error = aDecoder.decodeObject(forKey: "error") as? Bool
         openCount = aDecoder.decodeObject(forKey: "openCount") as? Int
         openInvoices = aDecoder.decodeObject(forKey :"openInvoices") as? [OpenInvoice]
         paidInvoices = aDecoder.decodeObject(forKey :"paidInvoices") as? [OpenInvoice]
         status = aDecoder.decodeObject(forKey: "status") as? Int
         totalAmount = aDecoder.decodeObject(forKey: "totalAmount") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if error != nil{
            aCoder.encode(error, forKey: "error")
        }
        if openCount != nil{
            aCoder.encode(openCount, forKey: "openCount")
        }
        if openInvoices != nil{
            aCoder.encode(openInvoices, forKey: "openInvoices")
        }
        if paidInvoices != nil{
            aCoder.encode(paidInvoices, forKey: "paidInvoices")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if totalAmount != nil{
            aCoder.encode(totalAmount, forKey: "totalAmount")
        }

    }

}


class OpenInvoice : NSObject, NSCoding{

    var amount : String!
    var createdDate : String!
    var discount : String!
    var dueDate : String!
    var id : String!
    var notes : String!
    var orderNo : String!
    var paid : String!
    var tax : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        amount = dictionary["amount"] as? String
        createdDate = dictionary["created_date"] as? String
        discount = dictionary["discount"] as? String
        dueDate = dictionary["due_date"] as? String
        id = dictionary["id"] as? String
        notes = dictionary["notes"] as? String
        orderNo = dictionary["order_no"] as? String
        paid = dictionary["paid"] as? String
        tax = dictionary["tax"] as? String
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
        if createdDate != nil{
            dictionary["created_date"] = createdDate
        }
        if discount != nil{
            dictionary["discount"] = discount
        }
        if dueDate != nil{
            dictionary["due_date"] = dueDate
        }
        if id != nil{
            dictionary["id"] = id
        }
        if notes != nil{
            dictionary["notes"] = notes
        }
        if orderNo != nil{
            dictionary["order_no"] = orderNo
        }
        if paid != nil{
            dictionary["paid"] = paid
        }
        if tax != nil{
            dictionary["tax"] = tax
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
         createdDate = aDecoder.decodeObject(forKey: "created_date") as? String
         discount = aDecoder.decodeObject(forKey: "discount") as? String
         dueDate = aDecoder.decodeObject(forKey: "due_date") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         notes = aDecoder.decodeObject(forKey: "notes") as? String
         orderNo = aDecoder.decodeObject(forKey: "order_no") as? String
         paid = aDecoder.decodeObject(forKey: "paid") as? String
         tax = aDecoder.decodeObject(forKey: "tax") as? String

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
        if createdDate != nil{
            aCoder.encode(createdDate, forKey: "created_date")
        }
        if discount != nil{
            aCoder.encode(discount, forKey: "discount")
        }
        if dueDate != nil{
            aCoder.encode(dueDate, forKey: "due_date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if notes != nil{
            aCoder.encode(notes, forKey: "notes")
        }
        if orderNo != nil{
            aCoder.encode(orderNo, forKey: "order_no")
        }
        if paid != nil{
            aCoder.encode(paid, forKey: "paid")
        }
        if tax != nil{
            aCoder.encode(tax, forKey: "tax")
        }

    }

}
