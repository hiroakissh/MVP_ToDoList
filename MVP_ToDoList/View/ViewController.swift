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
        tableView.delegate = self
        
        //newItemTextField.delegate = self
        
        presenter.viewDidLoad()
        
    }

    @IBAction func tappedAddButton(_ sender: Any) {
        if !newItemTextField.text!.isEmpty {
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
        }
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

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            presenter.didEditingDelete(at: indexPath)
        }
    }
    
}



