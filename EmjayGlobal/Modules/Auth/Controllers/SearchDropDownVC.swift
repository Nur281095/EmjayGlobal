//
//  SearchDropDownVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 10/11/2022.
//

import UIKit
import SwiftyJSON

protocol SearchDropDownDelegate {
    func didSelectContry(countries: [CountryModel], conID: String)
    func didSelectState(states: [CountryModel], stateID: String)
    func didSelectCity(cities: [CountryModel], cityID: String)
}

class SearchDropDownVC: BaseVC, UISearchBarDelegate {

    @IBOutlet weak var searchBr: UISearchBar!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var tblV: UITableView!
    
    
    var countries = [CountryModel]()
    var states = [CountryModel]()
    var cities = [CountryModel]()
    
    var filterCountries = [CountryModel]()
    var filterStates = [CountryModel]()
    var filterCities = [CountryModel]()
    
    var isFilter = false
    
    enum DataType {
        case country
        case state
        case city
    }
    var delegate: SearchDropDownDelegate?
    var dataTyp = DataType.country
    var conID = ""
    var stateID = ""
    var cityID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBr.delegate = self
        if self.dataTyp == .country && countries.isEmpty {
            self.getCountries()
        } else if self.dataTyp == .state && states.isEmpty {
            self.getStates()
        } else if self.dataTyp == .city && cities.isEmpty {
            self.getCities()
        }
    }
    
    func getCountries() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getCountries") { response in
            Util.shared.hideSpinner()
            print(response)
            if let data = response["data"] as? [[String: AnyObject]] {
                for d in data {
                    self.countries.append(CountryModel(fromDictionary: d))
                }
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
    
    func getStates() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getStates?country_id=\(self.conID)") { response in
            Util.shared.hideSpinner()
            print(response)
            if let data = response["data"] as? [[String: AnyObject]] {
                for d in data {
                    self.states.append(CountryModel(fromDictionary: d))
                }
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
    
    func getCities() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getCities?state_id=\(self.stateID)") { response in
            Util.shared.hideSpinner()
            print(response)
            if let data = response["data"] as? [[String: AnyObject]] {
                for d in data {
                    self.cities.append(CountryModel(fromDictionary: d))
                }
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }
    }
    

    @IBAction func checkTap(_ sender: Any) {
        if self.dataTyp == .country {
            if isFilter {
                countries.forEach{ $0.isSelected = false }
                countries.filter {$0.countryId == conID}.first?.isSelected = true
            }
            delegate?.didSelectContry(countries: countries, conID: conID)
        } else if self.dataTyp == .state {
            if isFilter {
                states.forEach{ $0.isSelected = false }
                states.filter {$0.id == stateID}.first?.isSelected = true
            }
            delegate?.didSelectState(states: states, stateID: stateID)
        } else {
            if isFilter {
                cities.forEach{ $0.isSelected = false }
                cities.filter {$0.id == cityID}.first?.isSelected = true
            }
            delegate?.didSelectCity(cities: cities, cityID: cityID)
        }
        self.goBack()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text ?? "").isEmpty {
            isFilter = false
        } else {
            isFilter = true
            if self.dataTyp == .country {
                filterCountries = countries.filter({ $0.country.contains(searchText) })
            } else if self.dataTyp == .state {
                filterStates = states.filter({ $0.name.contains(searchText) })
            } else {
                filterCities = cities.filter({ $0.name.contains(searchText) })
            }
        }
        tblV.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isFilter = true
        let txt = searchBar.text
        if self.dataTyp == .country {
            filterCountries = countries.filter({ $0.country.contains(txt ?? "") })
        } else if self.dataTyp == .state {
            filterStates = states.filter({ $0.name.contains(txt ?? "") })
        } else {
            filterCities = cities.filter({ $0.name.contains(txt ?? "") })
        }
        tblV.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        isFilter = false
        filterCountries.removeAll()
        filterStates.removeAll()
        filterCities.removeAll()
        tblV.reloadData()
    }
}

extension SearchDropDownVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataTyp == .country {
            return isFilter ? filterCountries.count : countries.count
        } else if self.dataTyp == .state {
            return isFilter ? filterStates.count : states.count
        } else {
            return isFilter ? filterCities.count : cities.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if self.dataTyp == .country {
            cell.textLabel?.text = isFilter ? filterCountries[indexPath.row].country : countries[indexPath.row].country
            cell.accessoryType = isFilter ? (filterCountries[indexPath.row].isSelected ? .checkmark : .none) : (countries[indexPath.row].isSelected ? .checkmark : .none)
        } else if self.dataTyp == .state {
            cell.textLabel?.text = isFilter ? filterStates[indexPath.row].name : states[indexPath.row].name
            cell.accessoryType = isFilter ? (filterStates[indexPath.row].isSelected ? .checkmark : .none) : (states[indexPath.row].isSelected ? .checkmark : .none)
        } else {
            cell.textLabel?.text = isFilter ? filterCities[indexPath.row].name : cities[indexPath.row].name
            cell.accessoryType = isFilter ? (filterCities[indexPath.row].isSelected ? .checkmark : .none) : (cities[indexPath.row].isSelected ? .checkmark : .none)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.dataTyp == .country {
            if isFilter {
                filterCountries.forEach{ $0.isSelected = false }
                filterCountries[indexPath.row].isSelected = true
                conID = filterCountries[indexPath.row].countryId
            } else {
                countries.forEach{ $0.isSelected = false }
                countries[indexPath.row].isSelected = true
                conID = countries[indexPath.row].countryId
            }
        } else if self.dataTyp == .state {
            if isFilter {
                filterStates.forEach{ $0.isSelected = false }
                filterStates[indexPath.row].isSelected = true
                stateID = filterStates[indexPath.row].id
            } else {
                states.forEach{ $0.isSelected = false }
                states[indexPath.row].isSelected = true
                stateID = states[indexPath.row].id
            }
        } else {
            if isFilter {
                filterCities.forEach{ $0.isSelected = false }
                filterCities[indexPath.row].isSelected = true
                cityID = filterCities[indexPath.row].id
            } else {
                cities.forEach{ $0.isSelected = false }
                cities[indexPath.row].isSelected = true
                cityID = cities[indexPath.row].id
            }
        }
        tblV.reloadData()
    }
}
