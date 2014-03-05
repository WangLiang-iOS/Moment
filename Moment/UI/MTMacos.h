//
//  MTMacos.h
//  Moment
//
//  Created by wangliang-ms on 14-2-8.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#ifndef Moment_MTMacos_h
#define Moment_MTMacos_h

#define localstring(X) NSLocalizedString(X,nil)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
