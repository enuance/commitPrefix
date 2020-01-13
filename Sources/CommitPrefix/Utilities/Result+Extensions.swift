//
//  Result+Extensions.swift
//  commitPrefix
//
//  MIT License
//
//  Copyright (c) 2020 STEPHEN L. MARTINEZ
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import Consler

extension Result {
    
    func transform<NewSuccess>(_ newValue: NewSuccess) -> Result<NewSuccess, Failure> {
        switch self {
        case .success:
          return .success(newValue)
        case let .failure(failure):
          return .failure(failure)
        }
    }
    
}

extension Result where Failure == CPError {
    
    func resolveOrExit() -> Success {
        switch self {
        case let .success(value):
            return value
        case let .failure(cpError):
            Consler.output(cpError.message, type: .error)
            exit(cpError.status.value)
        }
    }
    
}