//
//  CPError.swift
//  commitPrefix
//
//  MIT License
//
//  Copyright (c) 2019 STEPHEN L. MARTINEZ
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

enum CPError: Error {
    
    case userCommandNotRecognized
    case newEntryShouldNotHaveSpaces
    case emptyEntry
    case multipleArguments
    case notAGitRepo(currentLocation: String)
    case fileReadWriteError
    case directoryNotFound(name: String, path: String)
    case hookReadWriteError
    case branchValidatorFormatError
    
    var message: String {
        switch self {
        case .userCommandNotRecognized:
            return "Command not recognized. Enter \"--help\" for usage."
        case .newEntryShouldNotHaveSpaces:
            return "Your entry contains invalid spaces."
        case .emptyEntry:
            return "Your entry is empty."
        case .multipleArguments:
            return "Too many arguments entered. Only two at a time is supported."
        case .notAGitRepo(currentLocation: let location):
            return "Not in a git repo or at the root of one: \(location)"
        case .fileReadWriteError:
            return "An error occured while reading or writing to the CommitPrefix files"
        case .directoryNotFound(name: let name, path: let path):
            return "Directory named \(name) was not found at \(path)"
        case .hookReadWriteError:
            return "An error occured while reading or writing to the commit-msg hook"
        case .branchValidatorFormatError:
            return "The branch validator must be at least two characters long "
            + "and contain no numbers or spaces"
        }
        
    }
    
}

/// An Error Type that should terminate the program if detected
enum CPTermination: Error {
    
    case overwriteCancelled
    case expectedYesOrNo
    case branchValidatorNotPresent
    case invalidBranchPrefix(validator: String)
    
    var message: String {
        switch self {
        case .overwriteCancelled:
            return "Overwrite is cancelled"
        case .expectedYesOrNo:
            return "Expected y or n. The transaction has been cancelled."
        case .branchValidatorNotPresent:
            return "Attempting to provide a branch prefix without a branch validator"
        case .invalidBranchPrefix(validator: let validator):
            return """
            Your branch does not begin with \(validator) and is invalid.
            Either change your branch name or use commitPrefix in non-branch mode.
            """
        }
        
    }
    
}