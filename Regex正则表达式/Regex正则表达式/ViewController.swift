//
//  ViewController.swift
//  Regex正则表达式
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

import UIKit

//匹配方法
/*
 //根据规则匹配一个字符串，返回NSTextCheckingResult数组
 open func matches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: NSRange) -> [NSTextCheckingResult]
 //根据规则匹配一个字符串，返回匹配到的个数
 open func numberOfMatches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: NSRange) -> Int
 //根据规则匹配一个字符串，返回NSTextCheckingResult
 open func firstMatch(in string: String, options: NSRegularExpression.MatchingOptions = [], range: NSRange) -> NSTextCheckingResult?
 //根据规则匹配一个字符串，返回匹配到的第一范围
 open func rangeOfFirstMatch(in string: String, options: NSRegularExpression.MatchingOptions = [], range: NSRange) -> NSRange
 
 */

//匹配设置
/*
 caseInsensitive                : 忽略大小写
 allowCommentsAndWhitespace     : 忽略空白字符，以及前缀是 # 开始的注释
 ignoreMetacharacters           : 将整个匹配方案作为文字字符串
 dotMatchesLineSeparators       : 允许 . 匹配任意字符，包括回车换行
 anchorsMatchLines              : 允许 ^ 和 $ 匹配多行文本的开始和结尾
 useUnixLineSeparators          :  = 1 << 5, 仅将 \n 作为换行符
 useUnicodeWordBoundaries       :  = 1 << 6 使用 Unicode TR#29 指定单词边界
 */

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let qq = "a12345"
        
        //        print("is qq - \(checkQQ(qqStr: qq) ? "YES" : "NO")")
        
//        print("is qq - \(checkQQRegex(qqStr: qq) ? "YES" : "NO")")

        
        print("is Phone - \(checkPhoneNum(phone: "12345678901") ? "YES" : "NO")")
        print("is Phone - \(checkPhoneNum(phone: "02345678901") ? "YES" : "NO")")
        print("is Phone - \(checkPhoneNum(phone: "133456a8901") ? "YES" : "NO")")
        print("is Phone - \(checkPhoneNum(phone: "18682111780") ? "YES" : "NO")")
    }
    

    
    //正则
    private func checkQQRegex(qqStr : String) -> Bool{
        do {
            //1、创建规则
            let pattern = "[1-9][0-9]{4,14}"
            
            //2、创建正则表达式
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            //3、匹配
            let range = regex.rangeOfFirstMatch(in: qqStr, options: NSRegularExpression.MatchingOptions(rawValue : 0), range: NSRange(location: 0, length: qqStr.characters.count))
            
            if range.location == 0 && range.length >= 5 {
                return true
            }
            
        } catch{
            print(error)
        }
        
        return false
        
    }
    
    // 普通的判断方法
    private func checkQQ(qqStr : String) -> Bool{
        /*
         1、不能以0开头
         2、在5到15位之间
         3、必须是全数字
         */
        
        if qqStr.hasPrefix("0") {
            return false
        }
        
        if qqStr.characters.count < 5 || qqStr.characters.count > 15 {
            return false
        }
        
        for c in qqStr.characters{
            if c < "0" || c > "9" {
                return false
            }
        }
        
        return true
        
    }
    
    private func checkPhoneNum(phone : String) -> Bool{
        /*
         1、第一位必须是1
         2、第二位是：3 5 7 8 
         3、长度要是11位数
         4、必须全部是数字
         */
        //1、创建规则
        let pattern = "[1][3578]\\d{9}"
        do {
            //2、创建匹配对象
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            //3、匹配
            let range = regex.rangeOfFirstMatch(in: phone, options: NSRegularExpression.MatchingOptions(rawValue : 0), range: NSRange(location: 0, length: phone.characters.count))
            if range.location == 0 && range.length == 11 {
                return true
            }
            
        } catch{
            print(error)
        }
        return false
        
    }
    
}

