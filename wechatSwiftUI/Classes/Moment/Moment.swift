//
//  Moment.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import SwiftUI

struct Moment: View {
    
    // 获取和设置 statusBarStyle
    @Environment(\.statusBarStyle) var statusBarStyle
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                VStack {
                    Color.black
                        .frame(height: 300)
                    Spacer()
                }
                MomentList()
            }
            .overlayPreferenceValue(NavigationKey.self) { value in
                VStack {
                    self.navigationTransition(proxy: proxy, value: value)
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
        }
        .hiddenTabBar()
        .navigationBarHidden(true)
        .onAppear(perform: viewAppear)
        .onDisappear(perform: viewDisappear)
    }
    
    func viewAppear() {
        // 进入时设置回 `lightContent`
         self.statusBarStyle.current = .lightContent
    }
    
    func viewDisappear() {
        // 离开时设置回 `default`
        self.statusBarStyle.current = .default
    }
    
    func navigationTransition(proxy: GeometryProxy, value: [Anchor<CGPoint>]) -> some View {
        let height = proxy.safeAreaInsets.top + 44
        let progress: CGFloat
        
        if let anchor = value.first {
            // proxy[anchor] 作用是得到 anchor 在 proxy 中的相对位置
            // -proxy[anchor].y 为 0 时代表 Header 底部正好在界面顶部的位置
            // 为了与导航栏高度配合，+ height + 20，过渡位置更缓和
            // 最后 / 44 即在 44px 距离内完成隐藏到显示
            progress = max(0, min(1, (-proxy[anchor].y + height + 20) / 44))
        } else {
            progress = 1.0
        }
        
        // 同时更新状态栏样式
        statusBarStyle.current = progress > 0.3 ? .default : .lightContent
        
        return NavigationFakeView(progress: progress).frame(height: height)
    }
}

struct NavigationFakeView: View {
    let progress: Double
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(
                    Color("light_gray")
                        .opacity(progress)
                )
            
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("back").renderingMode(.template)
                }
                .padding()
                
                Spacer()
                
                Button {
                    print("发朋友圈..")
                } label: {
                    Image(systemName: progress > 0.4 ? "camera" : "camera.fill")
                }
                .padding()
            }
            .accentColor(Color(white: colorScheme == .light ? 1 - progress : 1))
            .frame(height: 44)
            
            Text("朋友圈")
                .font(.system(size: 16, weight: .bold))
                .opacity(progress)
                .frame(height: 44, alignment: .center)
        }
        .frame(maxWidth: .infinity)
    }
    
}

extension Moment {
    
    struct NavigationKey: PreferenceKey {
        
        typealias Value = [Anchor<CGPoint>]
        static var defaultValue: Value = []
        
        static func reduce(value: inout [Anchor<CGPoint>], nextValue: () -> [Anchor<CGPoint>]) {
            value.append(contentsOf: nextValue())
        }
    }
}

struct Moment_Previews: PreviewProvider {
    static var previews: some View {
        Moment()
    }
}


/// GeometryReader
///     size比较直观，就是返回父view建议的尺寸
///     subscript可以让我们获取.leading,.top等等类似这样的数据
///     safeAreaInsets可以获取安全区域的Insets
///     frame(in:)要求传入一个CoordinateSpace类型的参数，也就是坐标空间，可以是.local, .global 或者 .named()，其中 .named()可以自定义坐标空间
///


/// PreferenceKey
/// 使用preferences，我们可以在视图树中传递值，从视图到其祖先
/// 反向传值
