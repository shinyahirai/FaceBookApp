//
//  GAViewController.m
//  Mi
//
//  Created by Shinya Hirai on 2/26/14.
//  Copyright (c) 2014 Shinya Hirai. All rights reserved.
//

#import "GAViewController.h"

@interface GAViewController ()

@end

@implementation GAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary* object = @{
                             @"fbsdk:create_object": @YES,
                             @"type": @"books.book",
                             @"title": @"Snow Crash",
                             @"url": @"https://apps.notrepro.net/fbsdktoolkit/objects/books/Snow-Crash.html",
                             @"image": @"http://en.wikipedia.org/wiki/File:Snowcrash.jpg",
                             @"data": @{@"isbn": @"0553380958"}
                             };
    
    id<FBOpenGraphAction> action = (id<FBOpenGraphAction>)[FBGraphObject graphObject];
    [action setObject:object forKey:@"book"];
    
    [FBDialogs presentShareDialogWithOpenGraphAction:action
                                          actionType:@"books.reads"
                                 previewPropertyName:@"book"
                                             handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                                 if(error) {
                                                     NSLog(@"Error: %@", error.description);
                                                 } else {
                                                     NSLog(@"Success!");
                                                 }
                                             }];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
