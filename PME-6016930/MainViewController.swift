//







//  ViewController.swift
//  PME-6016930
//
//  Created by Suesawatwanich Chayapam on 24/3/2564 BE.
//  Copyright © 2564 CS3432. All rights reserved.
//

import UIKit
import ObjectMapper



class MainViewController: UIViewController {
    var restuarants : [Restuarant] = []
    var subscribed : [Restuarant]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        restuarants = getDatas()
        // Do any additional setup after loading the view.
    }
    
    func navigateToNextScreen(model: Restuarant) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "resInfoVC") as! ResInfoViewController
        newViewController.modelTapped = model
        newViewController.subscribes = subscribed!
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func loadJsonFromFile() {
        print("startLoad")
        //       if let path = Bundle.main.path(forResource: "assets/Restuarant", ofType: "json") {
        //            do {
        //                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        //                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        //                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
        //                     let person = jsonResult["Restuarant"] as? [Any] {
        //                    print(jsonResult)
        //                    print(person)
        //                  }
        //              } catch {
        //                print("reading fails")
        //              }
        //        }
    }
    @IBAction func onSeeBookmark(_ sender: Any) {
        print("bookmarkClicked")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "bookmarkVC") as! BookmarkViewController
        newViewController.list = subscribed!
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func getDatas() -> [Restuarant] {
        var data =
        """
[
            {
                "name" : "Lilou Cafe",
                "location" : "The Yard Hostel, Phahonyothin Road, Bangkok",
                "cuisines" : "International Food - Vegeterian & Dessert Cafe",
                "averageCost" : "100 - 300 Baht per person",
                "hours" : "10.00 AM to 18.00 PM",
                "rating" : 4.7,
                "image" : "res2.png",
                "imageGallery" : [
                    "res2_00.png",
                    "res2_01.png",
                    "res2_02.png",
                    "res2_03.png",
                    "res2_04.png"
                ]
            },
            {
                "name" : "The Dock",
                "location" : "Maze Thonglor, Thonglor Soi 4, Bangkok",
                "cuisines" : "International Food - Casual Dining",
                "averageCost" : "500 - 1,000 Baht per person",
                "hours" : "10.00 AM to 22.00 PM",
                "rating" : 4.6,
                "image" : "res5.png",
                "imageGallery" : [
                    "res5_00.png",
                    "res5_01.png",
                    "res5_02.png",
                    "res5_03.png",
                    "res5_04.png",
                    "res5_05.png"
                ]
            },
            {
                "name" : "Ikkousha Ramen",
                "location" : "J Avenue, Thonglor Soi 5, Bangkok",
                "cuisines" : "Japanese Food & Ramen - Casual Dining",
                "averageCost" : "100 - 300 Baht per person",
                "hours" : "11.00 AM to 02.00 AM",
                "rating" : 4.5,
                "image" : "res3.png",
                "imageGallery" : [
                    "res3_00.png",
                    "res3_01.png",
                    "res3_02.png"
                ]
            },
            {
                "name" : "Sendo Sushi",
                "location" : "Maze Thonglor, Thonglor Soi 4, Bangkok",
                "cuisines" : "Japanese Food - Sushi Bar",
                "averageCost" : "500 - 1,000 Baht per person",
                "hours" : "11.00 AM to 14.00 PM, 17.30 PM to 22.00 PM",
                "rating" : 4.7,
                "image" : "res4.png",
                "imageGallery" : [
                    "res4_00.png",
                    "res4_01.png",
                    "res4_02.png"
                ]
            },
            {
                "name" : "Man Kitchen by Chef Man (CentralWorld)",
                "location" : "G Floor CentralWorld, Bangkok",
                "cuisines" : "Chinese Food - Buffet",
                "averageCost" : "500 - 1,000 Baht per person",
                "hours" : "11.00 AM to 22.00 PM",
                "rating" : 4.8,
                "image" : "res7.png",
                "imageGallery" : [
                    "res7_00.png",
                    "res7_01.png",
                    "res7_02.png",
                    "res7_03.png",
                    "res7_04.png"
                ]
            },
            {
                "name" : "Sugar Pop Cafe",
                "location" : "117 Phahonyothin Soi 7, Phaya Thai, Bangkok",
                "cuisines" : "Japanese Dessert Cafe",
                "averageCost" : "100 - 300 Baht per person",
                "hours" : "11.00 AM to 22.00 PM",
                "rating" : 4.5,
                "image" : "res6.png",
                "imageGallery" : [
                    "res6_00.png",
                    "res6_01.png",
                    "res6_02.png",
                    "res6_03.png"
                ]
            },
            {
                "name" : "Make Me Mango",
                "location" : "67 Maharat Road, Bangkok",
                "cuisines" : "Thai Food & Dessert Cafe",
                "averageCost" : "100 - 300 Baht per person",
                "hours" : "10.30 AM to 20.00 PM",
                "rating" : 4.8,
                "image" : "res1.png",
                "imageGallery" : [
                    "res1_00.png",
                    "res1_01.png",
                    "res1_02.png",
                    "res1_03.png"
                ]
            }
        ]
"""
        let mapped = Mapper<Restuarant>().mapArray(JSONfile: data)
        if(mapped == nil) {
            return []
        } else {
            return mapped!
        }
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restuarants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantVC", for: indexPath) as! RestuarantTVCell
        cell.bind(model: restuarants[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = restuarants[indexPath.row]
        navigateToNextScreen(model: model)
    }

}

