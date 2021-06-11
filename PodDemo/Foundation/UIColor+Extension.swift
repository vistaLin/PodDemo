//
//  UIColor+Extension.swift
//  PodDemo
//
//  Created by Lennon on 2021/6/11.
//

import UIKit

///项目公共颜色
extension UIColor {
    
    public class func colorWith(hex:String) -> UIColor {
        return UIColor.colorWith(hex: hex, alpha: 1.0)
    }
    
    // 十进制转换颜色 aa为前2未,后六位才是RGB
    public class func colorWith(decimalRGBA:String?) -> UIColor {
        guard let decimalRGBA = decimalRGBA  else {
            return .white
        }
        let str = decimalRGBA.replacingOccurrences(of: "#", with: "")
        if str.count != 8 {
            return .white
        }
        //处理数值
        var cString = str.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let aString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 6
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0,a:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        Scanner(string: aString).scanHexInt32(&a)

        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
    
    public class func colorWith(_ red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
     
         let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
         return color
     }
    
    // 转换16进制的颜色值
    public class func colorWith(hex:String, alpha:CGFloat = 1.0) -> UIColor {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
}

