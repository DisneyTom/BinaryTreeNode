//
//  ViewController.m
//  二叉树
//
//  Created by 梁晓龙 on 2017/3/23.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   BinaryTreeNode * rootTree = [BinaryTree createTreeWithValues:@[@"1",@"2",@"6",@"7",@"8",@"10",@"3",@"4"]];
   [BinaryTree treeFirstInformationWithNode:rootTree reslutBlock:^(NSInteger value) {
        NSLog(@"先序遍历value:%ld",value);
    }];
    
  [BinaryTree treeMiddleInformationWithNode:rootTree reslutBlock:^(NSInteger value) {
      NSLog(@"中序遍历value：%ld",value);
  }];
  
  [BinaryTree treeLastInformationWithNode:rootTree resultBlock:^(NSInteger value) {
       NSLog(@"后序遍历value：%ld",value);
  }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
