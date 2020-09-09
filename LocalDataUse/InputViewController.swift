//
//  InputViewController.swift
//  LocalDataUse
//
//  Created by 304 on 2020/09/07.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

   
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    @IBAction func back(_ sender: Any) {
        //텍스트 필드에 입력한 내용을 저장하고 이전 화면으로 이동
        
        //입력한 내용을 저장
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.name = tfName.text!
        
        let userDefaults = UserDefaults.standard
        if let email = tfEmail.text{
            userDefaults.set(email, forKey: "email")
        }
        
        //
        let viewController = presentingViewController as! ViewController
        viewController.dismiss(animated: true){
            () -> Void in
            viewController.lblName.text = self.tfName.text!
            viewController.lblEmail.text = self.tfEmail.text!
        }
        
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //AppDelegate 와 UserDefaults 에 저장한 내용을 출력하기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        tfName.text = appDelegate.name
        
        let userDefaults = UserDefaults.standard
        if let email = userDefaults.string(forKey: "email"){
            tfEmail.text = email
        }
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
