//
//  testModel.swift
//  MVP_ToDoList
//
//  Created by HiroakiSaito on 2021/10/05.
//

import Foundation

protocol TestModelInput{
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () -> ())
    func deleteItem(at index: Int, completion: () -> ())
}

final class TestModel: TestModelInput{
    
    private let userDefaluts = UserDefaults.standard
    private let ITEM_KEY = "TodoItems"
    
    func fetchItems() -> [String] {
        
        let test = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        print(test)
        return test
    }
    
    func addItem(itemContent: String, completion: () -> ()) {
        var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        items.append(itemContent)
        userDefaluts.set(items, forKey:  ITEM_KEY)
        completion()
    }
    
    func deleteItem(at index: Int, completion: () -> ()) {
        var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        items.remove(at: index)
        userDefaluts.set(items, forKey: ITEM_KEY)
        completion()
    }
}
