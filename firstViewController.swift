//
//  firstViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 15/02/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class firstViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

