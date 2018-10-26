//
//  ViewController.swift
//  swimeeKeijiban
//
//  Created by 張翔 on 2018/10/26.
//  Copyright © 2018 張翔. All rights reserved.
//

import UIKit
import Firebase //追加する

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameTextField: UITextField! //名前入力用のTextField
    @IBOutlet var commentTextField: UITextField! //本文入力用のTextField
    
    //コードを足す部分
    var posts: [Post] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //コードを追加
        let db = Firestore.firestore()
        
        db.collection("Posts").addSnapshotListener { (querySnapshot, error) in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    let data = diff.document.data()
                    let newPost = Post(
                        name: data["name"] as! String,
                        comment: data["comment"] as! String,
                        date: data["date"] as! Date
                    )
                    
                    self.posts.append(newPost)
                }
            }
            
            self.posts.sort{$0.date > $1.date}
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count //書き換える部分
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        //コードを足す部分
        cell.nameLabel.text = posts[indexPath.row].name
        cell.commentLabel.text = posts[indexPath.row].comment
        
        return cell
    }
    
    //投稿ボタンを押したときの動き
    @IBAction func post() {
        //コードを足す部分
        let db = Firestore.firestore()
        
        db.collection("Posts").addDocument(data: [
            "name": nameTextField.text!,
            "comment": commentTextField.text!,
            "date": Date()
        ]) { (error) in
            if let error = error{
                print(error.localizedDescription)
            }
        }
        
        
        nameTextField.text = ""
        commentTextField.text = ""
    }


}

