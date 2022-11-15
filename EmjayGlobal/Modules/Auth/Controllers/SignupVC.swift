//
//  SignupVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit
import AAExtensions
import SwiftyJSON

class SignupVC: BaseVC, SearchDropDownDelegate {

    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var surNameTxt: UITextField!
    @IBOutlet weak var address1Txt: UITextField!
    @IBOutlet weak var address2Txt: UITextField!
    @IBOutlet weak var conTxt: UITextField!
    @IBOutlet weak var stateTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
        
    var countries = [CountryModel]()
    var states = [CountryModel]()
    var cities = [CountryModel]()
    var conID = ""
    var stateID = ""
    var cityID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func crossTap(_ sender: Any) {
        self.goBack()
    }
    @IBAction func contTap(_ sender: UIButton) {
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .searchDropDownVC) as! SearchDropDownVC
        vc.delegate = self
        vc.countries = self.countries
        vc.states = self.states
        vc.cities = self.cities
        vc.conID = self.conID
        vc.stateID = self.stateID
        vc.cityID = self.cityID
        vc.dataTyp = .country
        self.show(vc, sender: self)
    }
    @IBAction func stateTap(_ sender: UIButton) {
        if conID == "" {
            self.showTool(msg: "Please select country!", state: .warning)
            return
        }
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .searchDropDownVC) as! SearchDropDownVC
        vc.delegate = self
        vc.countries = self.countries
        vc.states = self.states
        vc.cities = self.cities
        vc.conID = self.conID
        vc.stateID = self.stateID
        vc.cityID = self.cityID
        vc.dataTyp = .state
        self.show(vc, sender: self)
    }
    @IBAction func cityTap(_ sender: UIButton) {
        if stateID == "" {
            self.showTool(msg: "Please select state!", state: .warning)
            return
        }
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .searchDropDownVC) as! SearchDropDownVC
        vc.delegate = self
        vc.countries = self.countries
        vc.states = self.states
        vc.cities = self.cities
        vc.conID = self.conID
        vc.stateID = self.stateID
        vc.cityID = self.cityID
        vc.dataTyp = .city
        self.show(vc, sender: self)
    }
    
    @IBAction func continueTap(_ sender: Any) {

        let fNameValid = Validator.validateString(text: fNameTxt.text, type: "First name")
        if !fNameValid.0 {
            print(fNameValid.1)
            self.showTool(msg: fNameValid.1, state: .error)
            return
        }
        
        let lNameValid = Validator.validateString(text: surNameTxt.text, type: "Surname")
        if !lNameValid.0 {
            print(lNameValid.1)
            self.showTool(msg: lNameValid.1, state: .error)
            return
        }
        
        let conValid = Validator.validateString(text: conTxt.text, type: "Country")
        if !conValid.0 {
            print(conValid.1)
            self.showTool(msg: conValid.1, state: .error)
            return
        }
        
        let stateValid = Validator.validateString(text: stateTxt.text, type: "State")
        if !stateValid.0 {
            print(stateValid.1)
            self.showTool(msg: stateValid.1, state: .error)
            return
        }
        
        let cityValid = Validator.validateString(text: cityTxt.text, type: "City")
        if !cityValid.0 {
            print(cityValid.1)
            self.showTool(msg: cityValid.1, state: .error)
            return
        }
        
        let mobileValid = Validator.validatePhone(text: mobileTxt.text, type: "Mobile")
        if !(mobileValid).0 {
            print(mobileValid.1)
            self.showTool(msg: mobileValid.1, state: .error)
            return
        }
        
        let emailValid = Validator.validateEmail(text: emailTxt.text)
        if !emailValid.0 {
            print(emailValid.1)
            self.showTool(msg: emailValid.1, state: .error)
            return
        }

        var dic = [String: AnyObject]()
        dic["first_name"] = fNameTxt.text as AnyObject
        dic["sur_name"] = surNameTxt.text as AnyObject
        dic["email"] = emailTxt.text as AnyObject
        dic["mobile"] = mobileTxt.text as AnyObject
        dic["address"] = address1Txt.text as AnyObject
        dic["address1"] = address2Txt.text as AnyObject
        dic["country_id"] = conID as AnyObject
        dic["state_id"] = stateID as AnyObject
        dic["city_id"] = cityID as AnyObject
        
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .signupIDVC) as! SignupIDVC
        vc.dic = dic
        self.show(vc, sender: self)
    }
    
    func didSelectCity(cities: [CountryModel], cityID: String) {
        if cityID != "" {
            self.cities = cities
            self.cityID = cityID
            self.cityTxt.text = self.cities.filter({$0.isSelected})[0].name
        }
    }
    func didSelectState(states: [CountryModel], stateID: String) {
        self.states = states
        self.stateID = stateID
        self.stateTxt.text = self.states.filter({$0.isSelected})[0].name
    }
    func didSelectContry(countries: [CountryModel], conID: String) {
        self.countries = countries
        self.conID = conID
        self.conTxt.text = self.countries.filter({$0.isSelected})[0].country
        
        self.states.removeAll()
        self.cities.removeAll()
        stateID = ""
        cityID = ""
        self.stateTxt.text = ""
        self.cityTxt.text = ""
    }

}
