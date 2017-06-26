//
//  studentListVC.swift
//  RealmDemo
//
//  Created by Mohamed El-Naggar on 6/26/17.
//  Copyright © 2017 Mohamed El-Naggar. All rights reserved.
//

import UIKit
import RealmSwift

class studentListVC: UIViewController {

    @IBOutlet weak var studentTable: UITableView!
    
    var students = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        studentTable.delegate = self
        studentTable.dataSource = self
        loadData()

        
        studentTable.tableFooterView = UIView()
        studentTable.separatorStyle = .none
        
        studentTable.register(UINib(nibName: "studentCell", bundle: nil ), forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let realm = try! Realm()
        
        let result = realm.objects(Student.self)
        
        var res = [Student]()
        result.forEach { (studentData) in
            res.append(studentData)
        }
        
        self.students = res
        studentTable.reloadData()
        
    }
}


extension studentListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}

extension studentListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = studentTable.dequeueReusableCell(withIdentifier: "cell") as? studentCell else {
            return UITableViewCell()
        }
        cell.student = students[indexPath.row]
        
        return cell
    }
    
}








