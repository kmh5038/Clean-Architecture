//
//  HttpResoneseStatus.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
