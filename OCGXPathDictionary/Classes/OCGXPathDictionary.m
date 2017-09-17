/*
 * OCGXPathDictionary.m
 *
 * Created by Oguzhan Cansin Gungor on 16/09/17.
 *
 * Copyright (c) 2017 Aslan-Apps. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *       This product includes software developed by Aslan-Apps.
 * 4. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "OCGXPathDictionary.h"

@implementation NSDictionary (OCGXPathDictionary)

- (id)parseDictionaryWithComponents:(NSString *)object, ... {
    NSMutableArray *objects = [NSMutableArray new];
    va_list ap;
    va_start(ap, object);
    while (object) {
        [objects addObject:object];
        object = va_arg(ap, id);
    }
    va_end(ap);
    return [self parseDictionaryWithObjects:objects.copy];
}

- (nullable id)parseDictionaryWithXPath:(NSString *)xPath {
    return [self parseDictionaryWithObjects:[xPath componentsSeparatedByString:@"/"]];
}

- (id)parseDictionaryWithObjects:(NSArray *)objects {
    NSMutableArray *xpathArray = [NSMutableArray arrayWithArray:objects];
    NSString *firstObject = xpathArray.firstObject;
    id childDictionary = self[firstObject];
    if (xpathArray.count > 1) {
        [xpathArray removeObjectAtIndex:0];
        return [childDictionary parseDictionaryWithObjects:xpathArray.copy];
    }
    return childDictionary;
}

@end