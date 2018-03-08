//
//  ViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 11/02/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    var simpleView1: UIView!
    var simpleView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleView2 = simpleVC2().view;
        simpleView1 = simpleVC1().view;
        viewContainer.addSubview(simpleView1);
        viewContainer.addSubview(simpleView2);
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViewController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewContainer.bringSubview(toFront: simpleView1)
            break;
        case 1:
            viewContainer.bringSubview(toFront: simpleView2)
            break;
        default:
        
           
            break;
        }
    
    }
    
}
