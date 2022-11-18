//
//  MomentRow.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/17.
//

import SwiftUI

struct MomentValues {
    
    static let spacing: CGFloat = 8
}

struct MomentRow: View {
    
    var model: MomentModel
    
    init(model: MomentModel) {
        self.model = model
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(model.user_info?.avatar ?? "")
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(6)
            
            MomentDynamicView(model: model)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 16, trailing: 20))
    }
}


struct MomentDynamicView: View {
    
    var model: MomentModel
    
    init(model: MomentModel) {
        self.model = model
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            MomentNameModule(model: model)
            
            MomentContectModule(model: model)
                .padding(.top, 8)
            
            if let view = dealPicture(model: model) {
                view.padding(.top, 8)
            }
            
            MomentTimeModule(model: model)
                .padding(.top, 16)
            
            Separator()
                .padding(.top, 16)
        }
        .padding(.top, 16)
    }
    
    /// 图片处理逻辑
    func dealPicture(model: MomentModel) -> AnyView? {
        guard let pictures = model.pictures, pictures.count > 0 else { return nil }
        var view: AnyView?
        
        if pictures.count == 1 {
            view = AnyView(MomentPicture1Module(models: pictures))
        } else  {
            view = AnyView(MomentPicture9Module(models: pictures))
        }
        
        return view
    }
}

/// 图片1图
struct MomentPicture1Module: View {
    var models: [MomentPicture] = []
    
    var body: some View {
        Image(models.first?.pic ?? "")
            .resizable()
            .frame(width: CGFloat(models.first?.w ?? 0), height: CGFloat(models.first?.h ?? 0))
    }
}

/// 图片9图
struct MomentPicture9Module: View {
    var models: [MomentPicture] = []
    
    var rows: Int { models.count / cols }
    var cols: Int { models.count == 4 ? 2 : min(models.count, 3) }
    var lastRowCols: Int { models.count % cols }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(0 ..< rows, id: \.self) { row in
                self.rowBody(row: row, isLast: false)
            }
            if lastRowCols > 0 {
                self.rowBody(row: rows, isLast: true)
            }
        }
    }
    
    func rowBody(row: Int, isLast: Bool) -> some View {
        HStack(spacing: 6) {
            ForEach(0 ..< (isLast ? self.lastRowCols : self.cols), id: \.self) { col in
                Image(models[row * self.cols + col].pic ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 60, maxWidth: 80, minHeight: 60, maxHeight: 80)
                    .aspectRatio(1, contentMode: .fill)
                    .clipped()
            }
        }
    }
}

/// 地点时间
struct MomentTimeModule: View {
    var model: MomentModel
    
    init(model: MomentModel) {
        self.model = model
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let location = model.location, !location.isEmpty {
                Text(location)
                    .foregroundColor(.secondary)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.bottom, 8)
            }
            if let time = model.time, !time.isEmpty {
                Text(time)
                    .foregroundColor(.secondary)
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
}

/// 内容栏，限制行数，通过引入YYKit
struct MomentContectModule: View {
    var model: MomentModel
    
    init(model: MomentModel) {
        self.model = model
    }
    
    var body: some View {
        Text(model.content ?? "")
            .foregroundColor(.secondary)
            .font(.system(size: 14, weight: .regular))
            .lineLimit(5)
    }
}


/// 名字栏
struct MomentNameModule: View {
    var model: MomentModel
    
    init(model: MomentModel) {
        self.model = model
    }
    
    var body: some View {
        Text(model.user_info?.user_name ?? "")
            .foregroundColor(.primary)
            .font(.system(size: 16, weight: .medium))
    }
    
}

struct MomentRow_Previews: PreviewProvider {
    static var previews: some View {
        MomentRow(model: MomentModel())
    }
}
