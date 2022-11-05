//
//  AppStoryboards.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//
import UIKit

extension UIStoryboard {
    
    //MARK:- Generic Public/Instance Methods
    
    func loadViewController(withIdentifier identifier: viewControllers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    //MARK:- Class Methods to load Storyboards
    
    class func storyBoard(withName name: storyboards) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue , bundle: Bundle.main)
    }
    
    class func storyBoard(withTextName name:String) -> UIStoryboard {
        return UIStoryboard(name: name , bundle: Bundle.main)
    }
    
}

enum storyboards : String {
    case auth = "Auth",
         home = "Home",
         designer = "Designer",
         order = "Order",
         notification = "Notification",
         more = "More",
         cart = "Cart",
         profile = "Profile",
         filter = "Filter"
}

enum viewControllers: String {
    
    //Main Storyboard
    case loginVC = "LoginVC",
         signupVC = "SignupVC",
         homeVC = "HomeVC",
         designerVC = "DesignerVC",
         ordersVC = "OrdersVC",
         notificationsVC = "NotificationsVC",
         moreVC = "MoreVC",
         filterVC = "FilterVC",
         seeAllVC = "SeeAllVC",
         cartVC = "CartVC",
         addAddressVC = "AddAddressVC",
         selectCardVC = "SelectCardVC",
         checkoutVC = "CheckoutVC",
         thankuVC = "ThankuVC",
         orderDetailVC = "OrderDetailVC",
         favoriteVC = "FavoriteVC",
         profileVC = "ProfileVC",
         editProfileVC = "EditProfileVC",
         settingVC = "SettingVC",
         webVC = "WebVC",
         productDetailVC = "ProductDetailVC",
         moreDetailVC = "MoreDetailVC",
         filterLargeVC = "FilterLargeVC",
         changePasswordVC = "ChangePasswordVC"
}
