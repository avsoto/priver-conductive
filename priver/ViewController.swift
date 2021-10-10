//
//  ViewController.swift
//  priver
//
//  Created by ANA on 10/6/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var clickBtnRides: roundButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapRidesButton(sender: UIButton){
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginController") else{
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

class roundButton: UIButton{
    override func didMoveToWindow() {
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

