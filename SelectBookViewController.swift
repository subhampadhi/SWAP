//
//  SelectBookViewController.swift
//  SWAP
//
//  Created by Subham Padhi on 28/03/18.
//  Copyright © 2018 Subham Padhi. All rights reserved.
//

import UIKit
import SwiftyJSON
import FirebaseDatabase

class SelectBookViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
   
   var mystring = String()
    
    var notFound : String? = "No Info there"
    var selectedBookName : String? //done
    var selectedBookId : String?  //done
    var selectedselfLink : String? //done
    var selectedBookDescription : String? //done
    var selectedsmallThumbnail : String? //done
    var selectedthumbnail : String?  //done
    var selectedinfoLink : String?//done
    var selectedlanguage : String? //done
    var selectedmaturityRating : String? //done
    var selectedpageCount : String?
    var selectedpublishedDate : String?
    var selectedpublisher : String?
    var selectedAuthorName : String?
    
    
    var bookNamearray = [String?]() //done
    var bookid = [String?]()  //done
    var selfLink = [String?]() // done
    var BookDescription = [String?]() //done
    var smallThumbnail = [String?]() //done
    var thumbnail = [String?]()  // done
    var infoLink = [String?]()   //done
    var language = [String?]() //done
    var maturityRating = [String?]() //done
    var pageCount = [String?]() //done
    var publishedDate = [String?]() //done
    var publisher = [String?]()  //done
    var author = [String?]()   //done
    
    
    
    
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        bookNamearray = []
        let urlString = "https://www.googleapis.com/books/v1/volumes?q="+mystring
        print(urlString)
        
        self.downloadJsonWithUrl(urlString: urlString)
        
        
        //put both on the same desktop..simulator and chrome
        tableView.dataSource = self
    }
        // Do any additional setup after loading the view.
        
       //fixed repetition..lol that is definitely not the correct spelling

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
    
    // do you remember setting this custom class?
    func downloadJsonWithUrl(urlString:String) {
        let url = NSURL(string : urlString)
        
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        _ = URLRequest(url:(url as URL?)!)
        downloadTask.httpMethod =  "GET"
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if error != nil{
                
                print(error!)
                
            }else
            {
                
                do{
                    let json = try JSON(data:data!)
                    
                    // print(json)
                    
                    let items = json["items"]
                    for(_,subJson) in items
                    {
                        let tn = subJson["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                        let stn = subJson["volumeInfo"]["imageLinks"]["smallThumbnail"].stringValue
                        let try1 = subJson["volumeInfo"]["authors"]
                        
                        for(_,subJson) in try1{
                            
                            let try2 = subJson.stringValue
                            
                            self.author.append(try2)
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        self.thumbnail.append(tn)
                        self.smallThumbnail.append(stn)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? NSDictionary{
                        
                        
                        
                        // print(jsonResult.value(forKey: "items"))
                        if let itemsarray = jsonResult.value(forKey: "items") as? NSArray {
                            
                            for items in itemsarray {
                                
                                if let itemsDict = items as? NSDictionary{
                                    // copy paste for others
                                    if let id = itemsDict.value(forKey: "id"){
                                        
                                        self.bookid.append(id as! String)
                                        
                                        // print(id)
                                    }
                                    
                                    //self link
                                    
                                    if let selflink1 = itemsDict.value(forKey: "selfLink"){
                                        
                                        self.selfLink.append(selflink1 as! String)
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    if let name = itemsDict.value(forKey: "volumeInfo") as? NSDictionary{
                                        let bookName = name.value(forKey: "title")
                                        if(bookName != nil){
                                            self.bookNamearray.append(bookName as! String)
                                            
                                        }else{
                                            self.bookNamearray.append(self.notFound)
                                        }
                                        
                                        let publishedDate1 = name.value(forKey: "publishedDate")
                                        if( publishedDate1 != nil){
                                            self.publishedDate.append(publishedDate1 as! String)
                                        }else{
                                            self.publishedDate.append(self.notFound)
                                        }
                                        let maturityRating1 = name.value(forKey: "maturityRating")
                                        if( maturityRating1 != nil){
                                            self.maturityRating.append( maturityRating1 as! String)
                                            
                                        }else{
                                            self.maturityRating.append(self.notFound)
                                        }
                                        let language1 = name.value(forKey: "language")
                                        if( language1 != nil){
                                            self.language.append(language1 as! String)
                                            
                                        }else{
                                            self.language.append(self.notFound)
                                        }
                                        let description1 = name.value(forKey: "description")
                                        if( description1 != nil){
                                            self.BookDescription.append(description1 as! String)
                                            
                                        } else{
                                            self.BookDescription.append(self.notFound)
                                        }
                                        
                                        let infoLink1 = name.value(forKey: "infoLink")
                                        if( infoLink1 != nil){
                                            self.infoLink.append(infoLink1 as! String)
                                            
                                        }else{
                                            self.infoLink.append(self.notFound)
                                        }
                                        
                                        let publisher1 = name.value(forKey: "publisher")
                                        if( publisher1 != nil){
                                            self.publisher.append(publisher1 as! String)
                                            
                                        }else{
                                            self.publisher.append(self.notFound)
                                        }
                                        
                                        let pagecount1 = name.value(forKey: "pageCount")
                                        if( pagecount1 != nil){
                                            let pagecount2 = String(describing: pagecount1)
                                            self.pageCount.append(pagecount2 as! String)
                                            
                                        }else{
                                            
                                            self.pageCount.append(self.notFound)
                                        }
                                        
                                        // authors name part
                                        
                                        /* if let authorArray = name.value(forKey: "authors") as? NSArray{
                                         
                                         for authors in authorArray {
                                         
                                         let authorName1 = authorArray[0] as! String
                                         
                                         self.author.append(authorName1)
                                         }
                                         } */
                                        
                                        // inside another dict
                                        
                                        /*   if let image = itemsDict.value(forKey:"imageLinks") as? NSDictionary {
                                         
                                         let smallThumbnail1 = name.value(forKey:"smallThumbnail")
                                         if( smallThumbnail1 != nil){
                                         self.smallThumbnail.append(smallThumbnail1 as! String)
                                         
                                         }else{
                                         self.smallThumbnail.append(self.notFound)
                                         }
                                         
                                         let thumbnail1 = name.value(forKey: "thumbnail")
                                         if( thumbnail1 != nil){
                                         self.thumbnail.append(thumbnail1 as! String)
                                         
                                         }else{
                                         self.thumbnail.append(self.notFound)
                                         
                                         }
                                         
                                         
                                         
                                         } */
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    OperationQueue.main.addOperation({
                                        self.tableView.reloadData()
                                    })
                                }
                            }
                        }
                    }
                    
                    
                } catch {
                    
                    print("JSON Failed")
                }
                
                
            }
            
            
        }).resume()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookNamearray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //step 1-> i added an if here to check if the array has actually read anything or not(from server)
        if(bookNamearray.count>0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            
            cell.bookNameLabel.text = bookNamearray[indexPath.row]
            
            return cell;
            
        }
            //if not then create a blank cell and return it.
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        
        selectedBookName = bookNamearray[indexPath.row]
        selectedBookId = bookid[indexPath.row]
        selectedselfLink = selfLink[indexPath.row]
        selectedBookDescription = BookDescription[indexPath.row]
        selectedsmallThumbnail = smallThumbnail[indexPath.row]
        selectedthumbnail = thumbnail[indexPath.row]
        selectedinfoLink = infoLink[indexPath.row]
        selectedlanguage = language[indexPath.row]
        selectedmaturityRating = maturityRating[indexPath.row]
        selectedpageCount = pageCount[indexPath.row]
        selectedpublishedDate = publishedDate[indexPath.row]
        selectedAuthorName = author[indexPath.row]
        selectedpublisher = publisher[indexPath.row]
        
        
        
        downloadJsonForselectedBook()
         setdatabase()
        
     
        
    }
    func downloadJsonForselectedBook() {
        
        print(self.selectedBookId as! String)
        print(self.selectedBookName as! String)
        print(self.selectedselfLink as! String)
        print(self.selectedAuthorName as! String)
        print(self.selectedBookDescription as! String)
        print(self.selectedsmallThumbnail as! String)
        print(self.selectedthumbnail as! String)
        print(self.selectedinfoLink as! String)
        print(self.selectedlanguage as! String)
        print(self.selectedmaturityRating as! String)
        print(self.selectedpageCount as! String)
        print(self.selectedpublishedDate as! String)
        print(self.selectedpublisher as! String)
        
        
        
        
        
        
        
        
        
    }
    
    func setdatabase() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("iOSTest").child("books").setValue(self.selectedBookId)

        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("id").setValue(self.selectedBookId)
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("selfLink").setValue(self.selectedselfLink)
         ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("authors").setValue(self.selectedAuthorName)
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("description").setValue(self.selectedBookDescription)
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("imageLinks").child("smallThumbnail").setValue(self.selectedsmallThumbnail)
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("imageLinks").child("thumbnail").setValue(self.selectedthumbnail)
          ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("infoLink").setValue(self.selectedselfLink)
           ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("language").setValue(self.selectedlanguage)
        
            ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("maturityRating").setValue(self.selectedmaturityRating)
        
                ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("pageCount").setValue(self.selectedpageCount)
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("publishedDate").setValue(self.selectedpublishedDate)
        
         ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("publishedDate").setValue(self.selectedpublishedDate)
        
         ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("publisher").setValue(self.selectedpublisher)
        
        ref.child("iOSTest").child("books").child(self.selectedBookId!).child("volumeInfo").child("title").setValue(self.selectedBookName)
        
        
        
        
        
        


    }
    

    
    
  

}
