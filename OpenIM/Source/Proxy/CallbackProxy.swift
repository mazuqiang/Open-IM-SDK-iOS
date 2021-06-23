//
//  CallbackProxy.swift
//  OpenIM
//
//  Created by Snow on 2021/6/10.
//

import OpenIMCore

class CallbackProxy<ResultType>: NSObject, Open_im_sdkBaseProtocol {
    
    private var callback: ((Result<ResultType, Error>) -> Void)?
    init(_ callback: ((Result<ResultType, Error>) -> Void)?) {
        assert(!"\(Self.self)".starts(with: "CallbackProxy<") || ResultType.self is Void.Type)
        self.callback = callback
    }
    
    func onError(_ errCode: Int, errMsg: String?) {
        let error = NSError(domain: "", code: errCode, userInfo: [NSLocalizedDescriptionKey: errMsg ?? ""])
        doResult(.failure(error))
    }

    func onSuccess(_ data: String?) {
        switch ResultType.self {
        case is Void.Type:
            doResult(.success(Void() as! ResultType))
        default:
            fatalError()
        }
    }
    
    fileprivate func doResult(_ result: Result<ResultType, Error>) {
        if let callback = self.callback {
            DispatchQueue.main.async {
                callback(result)
            }
            self.callback = nil
        }
    }
}

class CallbackArgsProxy<ResultType: Decodable>: CallbackProxy<ResultType> {
    override func onSuccess(_ str: String?) {
        do {
            let data = (str ?? "").data(using: .utf8)!
            let model = try JSONDecoder().decode(ResultType.self, from: data)
            doResult(.success(model))
        } catch {
            doResult(.failure(error))
        }
    }
}

class ProgressCallbackProxy: CallbackProxy<Void>, Open_im_sdkSendMsgCallBackProtocol {
    
    private var progress: ((Int) -> Void)?
    
    init(_ progress: @escaping ((Int) -> Void), callback: ((Result<Void, Error>) -> Void)?) {
        super.init(callback)
        self.progress = progress
    }
    
    override func doResult(_ result: Result<Void, Error>) {
        self.progress = nil
        super.doResult(result)
    }
    
    func onProgress(_ value: Int) {
        if let progress = self.progress {
            progress(value)
            if value >= 100 {
                self.progress = nil
            }
        }
    }
}
