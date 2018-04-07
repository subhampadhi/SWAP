//
//  LibraryViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 31/03/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    
    @IBOutlet weak var addBookButton: UIBarButtonItem!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Declaring array Variables
    
     var bookNameArray = [String?]()
    var bookUrlArray = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
