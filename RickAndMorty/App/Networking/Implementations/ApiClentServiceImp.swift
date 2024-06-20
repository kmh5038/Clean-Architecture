//
//  ApiClentServiceImp.swift
//  RickAndMorty
//
//  Created by 김명현 on 6/20/24.
//

import Foundation

struct ApiClentServiceImp: ApiClientService {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T where T : Decodable {
        guard let url = url else { throw ApiError.errorInUrl }
        return try await makeRequest(url: url)
    }
    
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
        let request = try await session.data(from: url)
        return try validateResponese(request: request)
    }
    
    private func validateResponese<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse)
    ) throws -> T {
        guard let httpResponese = request.httpResponse as? HTTPURLResponse
        else { throw ApiError.unknownError }
        
        switch httpResponese.statusCode {
        case HttpResponseStatus.ok:
            return try decoModel(data: request.data)
        case HttpResponseStatus.clientError:
            throw ApiError.clientError
        case HttpResponseStatus.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }
    
    private func decoModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data)
        guard let model = model else { throw ApiError.errorDecoding }
        return model
    }
}
