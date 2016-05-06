//
//  NSDate+BAUIKit.h
//  BAUIKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Alexander Borovikov
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
//

#import <Foundation/Foundation.h>

#define kSecondsMinute      60
#define kSecondsHour		3600
#define kSecondsDay         86400
#define kSecondsWeek		604800
#define kSecondsYear		31556926

@interface NSDate (BAUIKit)

#pragma mark Comparing dates

- (BOOL)isEarlierDate: (NSDate *)aDate;
- (BOOL)isLaterDate: (NSDate *)aDate;
- (BOOL)dateBetweenStartDate:(NSDate*)start andEndDate:(NSDate*)end;

#pragma mark Date formatting

- (NSString *)localeFormattedDateString;
- (NSString *)localeFormattedDateStringWithTime;
+ (NSDate *)localeFormatted;
- (NSDate *)dateFormattedLocale;

- (NSString *)formattedStringWithFormat:(NSString *)format;
- (NSDate *)dateWithoutTime;
+ (NSDate *)dateWithoutTime;

#pragma mark SQLite formatting

- (NSDate *)dateForSqlite;
+ (NSDate*)dateFromSQLString:(NSString*)dateStr;

#pragma mark Beginning and end of date components

- (NSDate *)startOfDay;

- (NSDate *)endOfDay;

- (NSDate *)beginningOfWeek;

- (NSDate *)beginningOfMonth;

- (NSDate *)beginningOfYear;

- (NSDate *)endOfWeek;

- (NSDate *)endOfMonth;

- (NSDate *)endOfYear;

#pragma mark Date math

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

- (NSDate *)dateBySubtractingMinutes:(NSInteger)minutes;

- (NSDate *)dateByAddingHours:(NSInteger)hours;

- (NSDate *)dateBySubtractingHours:(NSInteger)hours;

- (NSDate *)dateByAddingDays:(NSInteger)days;

- (NSDate *)dateBySubtractingDays:(NSInteger)days;

- (NSDate *)dateByAddingMonth:(int)monthes;

- (NSDate *)dateBySubstractingMonth:(int)monthes;

#pragma mark Date components

- (NSInteger)seconds;

- (NSInteger)minute;

- (NSInteger)hour;

- (NSInteger)day;

- (NSInteger)month;

- (NSInteger)week;

- (NSInteger)weekday;

- (NSInteger)year;

- (NSString *)monthName;

- (NSString *)yearFromDate;

@end
