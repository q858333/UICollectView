//
//  DBViewController.m
//  UICollectView
//
//  Created by dengbin on 14/9/3.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import "DBViewController.h"

@interface DBViewController ()
{
 
}
@end

@implementation DBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    // char a[10]=
     NSString *str=@"sadasd123";

     char *b=[str cString];
     char a[str.length];
     strcpy(a, b);
     for(int i=0;i<strlen(a);i++)
     {
         
         printf("%c",a[i]);
     }
      KL(a);
     printf("%s",a);
     NSString *s=[[NSString alloc] initWithCString:a encoding:NSUTF8StringEncoding];
     NSLog(@"%@",s);
     for(int i=0;i<strlen(a);i++)
     {
         
     }


}
void KL (char *inStr)
{
    for(int i=0;i<strlen(inStr);i++)
    {
        inStr[i]=inStr[i]^'t';
        
        printf("%c",inStr[i]);
    }
}

@end
