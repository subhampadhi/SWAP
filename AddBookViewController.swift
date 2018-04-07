//
//  AddBookViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 18/03/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//


import UIKit
import SwiftyJSON







class AddBookViewController: UIViewController {
    
    @IBOutlet weak var avarook: UITextField!
    
    // see the button action below is for add button not that button ...oh okay! my bad    // declaring all the variable values make it a class later
    
  
    @IBAction func addButton(_ sender: Any) {
        if(avarook.text != ""){
            
            performSegue(withIdentifier: "secondVC" , sender: self)
        }
       
       //let urlString = "https://www.googleapis.com/books/v1/volumes?q=
        //"+isbn!
        
      
        
    }
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //works now right? probably the outlet wasn't declared properly oo ok there is something else also.. i ll let you know if i have that problem.coolthnx

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SelectBookViewController
        secondController.mystring = avarook.text!
        //i ll run and show u where the problem is
    }
    
    
    

}






