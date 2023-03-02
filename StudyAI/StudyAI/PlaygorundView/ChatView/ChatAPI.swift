//
//  ChatAPI.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI
import Combine
import Alamofire
import OpenAISwift

class APIServiceManager {
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<ModelResponse, Error>{
        let model = Model(model: "CHOOSE MODEL AND PASTE HERE", prompt: message, temperature: 0.7, max_tokens: 2048)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.API_KEY)"
        ]
        
        return Future { [weak self] promise in
            guard let self = self else { return }
            AF.request(self.baseUrl + "completions", method: .post, parameters: model, encoder: .json, headers: headers).responseDecodable(of: ModelResponse.self) { response in
                switch response.result {
                case.success(let result):
                    promise(.success(result))
                case.failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

enum Constants {
    static let API_KEY = "YOUR OPENAI API"
}
