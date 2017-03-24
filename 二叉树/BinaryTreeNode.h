//
//  BinaryTreeNode.h
//  二叉树
//
//  Created by 梁晓龙 on 2017/3/23.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject
/**
 * 值
 */
@property(nonatomic,assign) NSInteger value;
/**
 * 左节点
 */
@property(nonatomic,strong) BinaryTreeNode * leftNode;
/**
 *  右节点
 */
@property(nonatomic,strong) BinaryTreeNode *  rightNode;

/**
 * 遍历构造器
 */

+(instancetype)nodeWithValue:(NSInteger) value;
@end

@interface BinaryTree : NSObject
//创建二叉树
+(BinaryTreeNode *)createTreeWithValues:(NSArray *)values;

//反转二叉树
+(BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode;

//反转二叉树（非递归）
+(BinaryTreeNode *)invertBinaryTreeWithoutRecursion:(BinaryTreeNode *)rootNode;

//二叉树深度
+(NSInteger )depathOfTree:(BinaryTreeNode *)rootNode;

//二叉树所有节点数。  节点数 = 左子树节点数 + 右子树节点数 + 1 （根节点）
+(NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode;

//二叉树中某个节点到根节点的路径
+(NSArray *)pathOfTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode;

//先序遍历
+(void)treeFirstInformationWithNode:(BinaryTreeNode *)rootNode reslutBlock:(void(^)(NSInteger value))block;

//中序遍历
+(void)treeMiddleInformationWithNode:(BinaryTreeNode *)rootNode reslutBlock:(void(^)(NSInteger value))block;

//后序遍历
+(void)treeLastInformationWithNode:(BinaryTreeNode *)rootNode resultBlock:(void(^)(NSInteger value)) block;

@end
