//
//  Observable.swift
//  Observable
//
//  Created by Itunu Raimi on 03/06/2022.
//

import Foundation

class Observable <T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> ()) {
        completion(value)
        listener = completion
    }
}


class ObservableHelper {
    var textToUpdate: Observable<String> = Observable(String())
    var apiManager: APIManager?
    
    init(manager: APIManager = APIManager()) {
        self.apiManager = manager
    }
    
    func generateRandomQuote() {
        apiManager?.generateRandomQuote(completion: { result in
            self.textToUpdate.value = result
        })
    }
}
