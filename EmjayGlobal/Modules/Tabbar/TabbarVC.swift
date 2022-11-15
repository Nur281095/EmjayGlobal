//
//  TabbarVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit

class TabbarVC: UITabBarController,UITabBarControllerDelegate,UINavigationControllerDelegate{
    
    
    let homeVC = UIStoryboard.storyBoard(withName: .home).loadViewController(withIdentifier: .homeVC) as! HomeVC
    let bookVC = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .bookVC) as! BookVC
    let shipVC = UIStoryboard.storyBoard(withName: .ship).loadViewController(withIdentifier: .shipVC) as! ShipVC
    let invoiceVC = UIStoryboard.storyBoard(withName: .invoice).loadViewController(withIdentifier: .invoiceVC) as! InvoiceVC
    
    
    
    init() {
        // perform some initialization here
        super.init(nibName: nil, bundle: nil)
       
        
        /********************* For home Tab *********************/
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home")?.withTintColor(UIColor(hexString: "#28769A")))
        homeVC.tabBarItem.tag = 0
        let homeNav = UINavigationController(rootViewController: homeVC)
        
        bookVC.tabBarItem = UITabBarItem(title: "Book", image: UIImage(named: "ic_book"), selectedImage: UIImage(named: "ic_book")?.withTintColor(UIColor(hexString: "#28769A")))
        bookVC.tabBarItem.tag = 1
        let bookNav = UINavigationController(rootViewController: bookVC)
        
        shipVC.tabBarItem = UITabBarItem(title: "Shipments", image: UIImage(named: "ic_ship"), selectedImage: UIImage(named: "ic_ship")?.withTintColor(UIColor(hexString: "#28769A")))
        shipVC.tabBarItem.tag = 2
        let shipNav = UINavigationController(rootViewController: shipVC)
        
        invoiceVC.tabBarItem = UITabBarItem(title: "Invoices", image: UIImage(named: "ic_invoice"), selectedImage: UIImage(named: "ic_invoice")?.withTintColor(UIColor(hexString: "#28769A")))
        invoiceVC.tabBarItem.tag = 3
        let invoiceNav = UINavigationController(rootViewController: invoiceVC)
        
        viewControllers = [homeNav,bookNav,shipNav, invoiceNav]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.delegate = self
        self.tabBar.isTranslucent = false
        
        self.tabBar.barTintColor = UIColor(hexString: "#F7F7F7")
        self.tabBar.tintColor = UIColor(hexString: "#28769A")
        self.tabBar.backgroundColor = UIColor(hexString: "#F7F7F7")
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "#747474")
        
//        self.tabBar.layer.masksToBounds = true
//        self.tabBar.layer.cornerRadius = 20
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
//        UITabBar.appearance().clipsToBounds = true
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 12)!], for: .normal)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func findSelectedTagForTabBarController(tabBarController: UITabBarController?) {
        
        if let tabBarController = tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                let selectedIndex = tabBarController.selectedIndex
                let selectedController: UIViewController? = viewControllers.count > selectedIndex ? viewControllers[selectedIndex] : nil
                if let tag = selectedController?.tabBarItem.tag {
                    //here you can use your tag
                    print(tag)
                }
            }
        }
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //findSelectedTagForTabBarController(navigationController.tabBarController)
        print("print \(viewController)")
        
        
    }
     
    
}

extension UITabBarController {
  func removeTabbarItemsText() {
    tabBar.items?.forEach {
      $0.title = nil
      $0.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
    }
  }
}
