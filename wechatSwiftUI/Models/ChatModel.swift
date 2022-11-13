//
//  ChatModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI

struct ChatModel: Identifiable {
    var id: String
    var avatar: String?
    var user_name: String?
    var content: String?
    var message: ChatMessageModel?
    var time: String?
}

extension ChatModel: Modelable {
    
    typealias Model = ChatModel
    
    static var swiftDisplayModel: ChatModel {
        ChatModel(
            id: "1",
            avatar: "data_avatar1",
            user_name: "SwiftUI",
            content: "SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.",
            time: "21:23")
    }
    
    static var swiftDisplayModels: [ChatModel] {
        [
            ChatModel(
                id: "1",
                avatar: "data_avatar1",
                user_name: "姚红",
                content: "快进群吃瓜",
                time: "刚刚"),
            ChatModel(
                id: "2",
                avatar: "data_avatar2",
                user_name: "李磊",
                content: "今晚打算去吃什么，我想去吃桂林米粉。",
                time: "20:23"),
            ChatModel(
                id: "3",
                avatar: "data_avatar3",
                user_name: "黄小宏",
                content: "给你发了一个`抖一抖`",
                time: "20:15"),
            ChatModel(
                id: "4",
                avatar: "data_avatar4",
                user_name: "小提莫",
                content: "快来玩英雄联盟，我已经超神了，你还不快来，我带你飞。",
                time: "20:10"),
            ChatModel(
                id: "5",
                avatar: "data_avatar5",
                user_name: "李主管",
                content: "明天可能需要回公司加班，可以吗？",
                time: "19:50"),
            ChatModel(
                id: "6",
                avatar: "data_avatar6",
                user_name: "老妈",
                content: "广州疫情这么严重，要不就请假在家算了，家里不缺钱，健康最重要！",
                time: "19:48"),
            ChatModel(
                id: "7",
                avatar: "data_avatar7",
                user_name: "海珠区某小街道群",
                content: "明天的菜各位都下来拿了吗，没有的赶紧下来拿！！",
                time: "19:30"),
            ChatModel(
                id: "8",
                avatar: "data_avatar8",
                user_name: "同事",
                content: "[红包]",
                time: "16:23"),
            ChatModel(
                id: "9",
                avatar: "data_avatar9",
                user_name: "lol小群",
                content: "上车~",
                time: "星期六"),
            ChatModel(
                id: "10",
                avatar: "data_avatar10",
                user_name: "刘虹",
                content: "你真的是个逗比~",
                time: "星期五"),
            ChatModel(
                id: "11",
                avatar: "data_avatar1",
                user_name: "谭小明",
                content: "再见啦，我回老家休息一段时间，一个月后见",
                time: "10月15日"),
            ChatModel(
                id: "12",
                avatar: "data_avatar8",
                user_name: "陈思凯",
                content: "开发造数据很麻烦的",
                time: "9月25日")
        ]
    }
}
