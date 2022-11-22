//
//  TransactionHistoryVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit
import SwiftyJSON

class TransactionHistoryVC: BaseVC {

    @IBOutlet weak var tblV: UITableView!
    
    
    var transactions = [TransactionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.title = "Transaction history"
        setupWhiteNav()
        getTransactions()
    }

    func getTransactions() {
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: [:], method: "transactionHistory") { response in
            Util.shared.hideSpinner()
            print(response)
            let json = JSON(response)
            if let status = json["status"].int {
                if status == 200 {
                    
                    if let data = response["data"] as? [[String: Any]] {
                        for d in data {
                            self.transactions.append(TransactionModel(fromDictionary: d))
                        }
                    }
                }
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
}

extension TransactionHistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        cell.configCell(model: transactions[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.storyBoard(withName: .profile).loadViewController(withIdentifier: .transactionDetailVC) as! TransactionDetailVC
        vc.trans = transactions[indexPath.row]
        self.show(vc, sender: self)
    }
}
