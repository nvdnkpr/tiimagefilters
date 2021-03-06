//
//  TiBlob+Greyscale.m
//  tiimagefilters
//
//  Created by KATAOKA,Atsushi on 11/06/27.
//  Copyright 2011 MARSHMALLOW MACHINE. All rights reserved.
//

#import "TiBlob+Template.h"
#import "TiBlob+Greyscale.h"

@implementation TiBlob (TiBlob_Greyscale)

- (id)greyscale:(id)arg
{    
    FilterOperation op = ^(uint8_t *buf, size_t bpr, ARGBIndex argb, uint32_t w, uint32_t h)
    {
        NSLog(@"[DEBUG] greyscale opeartion called.");
        
        for(int y = 0; y < h; y++){
            for(int x = 0; x < w; x++){
                uint8_t *pixel = buf + y * bpr + x * 4;
                int16_t R, G, B;
                
                R = *(pixel + argb.r);
                G = *(pixel + argb.g);
                B = *(pixel + argb.b);
                
                uint8_t y = (77 * R + 28 * G + 151 * B) / 256;
                
                *(pixel + argb.r) = y;
                *(pixel + argb.g) = y;
                *(pixel + argb.b) = y;
            }
        }
    };
    
    return [self operate:op];
}

@end
