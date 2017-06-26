//
//  registerStudentVC.swift
//  RealmDemo
//
//  Created by Mohamed El-Naggar on 6/26/17.
//  Copyright © 2017 Mohamed El-Naggar. All rights reserved.
//

import UIKit
import RealmSwift

class registerStudentVC: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        removeBorderFromTextField()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func removeBorderFromTextField() {
        firstName.removeBorder()
        lastName.removeBorder()
        email.removeBorder()
        phone.removeBorder()
    }
    
    @IBAction func registerStudentButton(_ sender: UIButton) {
        
        guard let fName = firstName.text?.trimmed , fName != "" else { return }
        guard let lName = lastName.text?.trimmed , lName != "" else { return }
        guard let mail = email.text?.trimmed , mail.checkMail else { return }
        
        let realm = try! Realm()
        
        let student = Student()
        student.fullName = (fName + " " + lName)
        student.mail = mail
        
        try! realm.write {
            realm.add(student)
        }
        
        if let firstVC = tabBarController?.viewControllers?.first as? studentListVC {
            
            firstVC.loadData()
            tabBarController?.willMove(toParentViewController: firstVC)
        }
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

