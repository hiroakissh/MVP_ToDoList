//
//  ViewController.swift
//  MVP_ToDoList
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit

class ViewController: UIViewController {
    
    private var presenter: TestPresenterInput!
    
    func inject (presenter: TestPresenterInput){
        self.presenter = presenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newItemTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        //tableView.delegate = self
        
        //newItemTextField.delegate = self
        
        presenter.viewDidLoad()
        
    }
}

extension ViewController: TestPresenterOutput{
    func updateItems(){
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)
        
        return cell
    }
}



