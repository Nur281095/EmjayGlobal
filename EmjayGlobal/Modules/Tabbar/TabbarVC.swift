//
//  TabbarVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit

class TabbarVC: UITabBarController,UITabBarControllerDelegate,UINavigationControllerDelegate{
    
    /*
    let homeVC = UIStoryboard.storyBoard(withName: .home).loadViewController(withIdentifier: .homeVC) as! HomeVC
    let desingVC = UIStoryboard.storyBoard(withName: .designer).loadViewController(withIdentifier: .designerVC) as! DesignerVC
    let orderVC = UIStoryboard.storyBoard(withName: .order).loadViewController(withIdentifier: .ordersVC) as! OrdersVC
    let notVC = UIStoryboard.storyBoard(withName: .notification).loadViewController(withIdentifier: .notificationsVC) as! NotificationsVC
    let moreVC = UIStoryboard.storyBoard(withName: .more).loadViewController(withIdentifier: .moreVC) as! MoreVC
    
    
    init() {
        // perform some initialization here
        super.init(nibName: nil, bundle: nil)
       
        
        /********************* For home Tab *********************/
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home_active"))
        homeVC.tabBarItem.tag = 0
        let homeNav = UINavigationController(rootViewController: homeVC)
        
        desingVC.tabBarItem = UITabBarItem(title: "Designers", image: UIImage(named: "ic_design"), selectedImage: UIImage(named: "ic_design_active"))
        desingVC.tabBarItem.tag = 1
        let desingNav = UINavigationController(rootViewController: desingVC)
        
        orderVC.tabBarItem = UITabBarItem(title: "My Orders", image: UIImage(named: "ic_my_order"), selectedImage: UIImage(named: "ic_my_order_active"))
        orderVC.tabBarItem.tag = 2
        let orderNav = UINavigationController(rootViewController: orderVC)
        
        notVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(named: "ic_notification"), selectedImage: UIImage(named: "ic_notification_active"))
        notVC.tabBarItem.tag = 3
        let notNav = UINavigationController(rootViewController: notVC)
        
        
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "ic_more"), selectedImage: UIImage(named: "ic_more_active"))
        moreVC.tabBarItem.tag = 4
        let moreNav = UINavigationController(rootViewController: moreVC)
       
        viewControllers = [homeNav,desingNav,orderNav,notNav, moreNav]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.delegate = self
        self.tabBar.isTranslucent = false
        
        self.tabBar.barTintColor = UIColor(hexString: "#F9F9F9")
        self.tabBar.tintColor = UIColor(hexString: "#0E9CEA")
        self.tabBar.backgroundColor = UIColor(hexString: "#FFFFFF")
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "#666F80")
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
     */
    
}

extension UITabBarController {
  func removeTabbarItemsText() {
    tabBar.items?.forEach {
      $0.title = nil
      $0.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
    }
  }
}
