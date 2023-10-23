//
//  ChatBubbleView.swift
//  ChatBubbleView
//
//  Created by Manuel Salinas on 10/23/23.
//

import SwiftUI

enum ChatStatus: String {
    case delivered, read, none
}

enum MessageType {
    case sender, receiver
}

struct ChatBubbleView: View {

    var title: String
    var style: MessageType = .sender
    var status: ChatStatus = .delivered

    var body: some View {
        HStack {

            if style == .sender {
                Spacer()
            }

            VStack(alignment: .trailing, spacing: 1) {
                Text(title)
                    .font(.title2)
                    .shadow(color: .gray, radius: 3, x: 1, y: 1)
                    .foregroundStyle(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(style == .sender ? .green : .blue)
                }

                if status != .none {
                    Text(status.rawValue)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }

            if style == .receiver {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatBubbleView(title: "que onda", status: .none)
}
