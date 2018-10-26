//
//  ViewController.swift
//  swimeeKeijiban
//
//  Created by 張翔 on 2018/10/26.
//  Copyright © 2018 張翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameTextField: UITextField! //名前入力用のTextField
    @IBOutlet var commentTextField: UITextField! //本文入力用のTextField
    
    //コードを足す部分

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //コードを足す部分
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //書き換える部分
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        //コードを足す部分
        
        return cell
    }
    
    //投稿ボタンを押したときの動き
    @IBAction func post() {
        //コードを足す部分
        
    }


}

