//
//  ContainerController.swift
//  IOS_App
//
//  Created by Ana Maria Novoa Ramos on 13/04/2019.
//  Copyright © 2019 Ana Maria Novoa Ramos. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    // MARK: - Properties
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
     
    }
  
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    // MARK: -Handlers
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        if menuController == nil{
            //add the menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent:self)
            
        }
    }
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand{
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width-80
                }, completion: nil)
        }else{
           //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelecMenuOption(menuOption: menuOption)
            
            }
        }
        animateStatusBar()
    }
    func didSelecMenuOption(menuOption: MenuOption){
        switch menuOption {
        case .Profile:
            print("Show profile")
        case .Inbox:
            print("Show Inbox")
        case .Notification:
            print("Show Notification")
        case .Settings:
            print("Show Settings")
        
        }
    }
    func animateStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController:HomeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded{
            configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
      }
 }
