//
//  testPresenter.swift
//  MVP_ToDoList
//
//  Created by HiroakiSaito on 2021/10/05.
//

import Foundation

protocol TestPresenterInput{
    var numberOfItems: Int{get}
    func item(forRow row: Int) -> String?
    func viewDidLoad()
}

protocol TestPresenterOutput: AnyObject{
    func updateItems()
}

final class TestPresenter: TestPresenterInput{

    
    private(set) var items: [String] = []
    
    private weak var view: TestPresenterOutput!
    private var model: TestModelInput
    
    init(view: TestPresenterOutput, model: TestModelInput){
        self.view = view
        self.model = model
    }
    
    var numberOfItems: Int{
        return items.count
    }
    
    func item(forRow row: Int) -> String? {
        guard row < items.count else {
            return nil
        }
        return items[row]
    }
    
    func viewDidLoad(){
        items = model.fetchItems()
        print("presenter")
        print(items)
        view.updateItems()
    }
}
