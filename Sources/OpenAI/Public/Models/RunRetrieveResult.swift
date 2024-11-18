//
//  RunsResult.swift
//  
//
//  Created by Chris Dillard on 11/07/2023.
//

import Foundation

public struct RunRetreiveResult: Codable, Equatable {

    public let status: String
    public let requiredAction: RequiredAction?
    public let usage: RunUsage?
    public let model: String?

    enum CodingKeys: String, CodingKey {
        case status
        case requiredAction = "required_action"
        case usage
        case model
    }
}

public struct RunUsage: Codable, Equatable {
    public let promptTokens: Int
    public let completionTokens: Int
    public let totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - RequiredAction
public struct RequiredAction: Codable, Equatable {
    public let submitToolOutputs: SubmitToolOutputs

    enum CodingKeys: String, CodingKey {
        case submitToolOutputs = "submit_tool_outputs"
    }
}

// MARK: - SubmitToolOutputs
public struct SubmitToolOutputs: Codable, Equatable {
    public let toolCalls: [ToolCallValue]

    enum CodingKeys: String, CodingKey {
        case toolCalls = "tool_calls"
    }
}

// MARK: - ToolCall
public struct ToolCallValue: Codable, Equatable {
    public let id: String
}
