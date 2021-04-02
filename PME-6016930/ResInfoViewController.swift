//
//  ResInfoViewController.swift
//  PME-6016930i












//
//  Created by Suesawatwanich Chayapam on 24/3/2564 BE.
//  Copyright © 2564 CS3432. All rights reserved.
//

import UIKit

class ResInfoViewController: UIViewController {
    
    var modelTapped : Restuarant? = nil
    var subscribes : [Restuarant]? = []

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var available: UILabel!
    @IBOutlet weak var cruisine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = modelTapped?.img
        name.text = modelTapped?.name
        location.text = modelTapped?.location
        available.text = modelTapped?.openHour
        cruisine.text = modelTapped?.cuisine
        // Do any additional setup after loading the view.
    }
    
    func addSubscribeOnBack(model: Restuarant) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var newViewController = storyBoard.instantiateViewController(withIdentifier: "viewControllerVC") as! MainViewController
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.subscribed = self.subscribes
        self.present(newViewController, animated: true, completion: nil)
    }
    

    @IBAction func onSubscribe(_ sender: Any) {
        print("subscribed")
        subscribes?.append(modelTapped!)
        addSubscribeOnBack(model: modelTapped!)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
