//
//  TransactionHistoryVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit

class TransactionHistoryVC: BaseVC {

    @IBOutlet weak var tblV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.title = "Transaction history"
        setupWhiteNav()
    }

}

extension TransactionHistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.storyBoard(withName: .profile).loadViewController(withIdentifier: .transactionDetailVC) as! TransactionDetailVC
        self.show(vc, sender: self)
    }
}
