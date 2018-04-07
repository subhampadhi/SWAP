//
//  ProfileViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 14/03/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import FirebaseDatabase




class ProfileViewController: UIViewController {
    
   
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBAction func logOut(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        
        

        super.viewDidLoad()
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("iOSTest").child("userData").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value and set it
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? ""
            self.userName.text = username;
            let emailID = value?["email"] as? String ?? ""
            self.UserEmail.text = emailID;

            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        

        
        
        
       
        
        
        
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

}
