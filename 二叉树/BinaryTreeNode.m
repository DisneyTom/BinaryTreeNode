//
//  BinaryTreeNode.m
//  二叉树
//
//  Created by 梁晓龙 on 2017/3/23.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode
+(instancetype) nodeWithValue:(NSInteger)value
{
    BinaryTreeNode * node =[[super alloc] init];
    node.value =value;
    return  node;
}
@end

@implementation BinaryTree
/**
 * 生成二叉树
 */
+(BinaryTreeNode *)createTreeWithValues:(NSArray *)values
{
    BinaryTreeNode * root =nil;
    for (NSInteger i = 0; i<values.count; i++) {
        NSInteger value =[(NSNumber *)[values objectAtIndex:i] integerValue];
        root =[[super class] addTreeNode:root value:value];
    }
    return root;
}

/**
 *  翻转二叉树（非递归）
    @param  rootNode 根节点
    @return 翻转后的根节点（其实就是原二叉树的根节点）
 */

+(BinaryTreeNode *)invertBinaryTreeWithoutRecursion:(BinaryTreeNode *)rootNode
{
    if (!rootNode)return nil;
    if (!rootNode.leftNode && !rootNode.rightNode)return rootNode;
    NSMutableArray * queueArray =[NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode]; //压入根节点
    while (queueArray.count>0) {
        BinaryTreeNode * node =[queueArray firstObject];
        [queueArray removeObjectAtIndex:0];//弹出最前面的节点，仿照队列先进先出原则
        BinaryTreeNode * pLeft = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = pLeft;
        
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    return rootNode;
}

/**
 *  翻转二叉树（又叫：二叉树的镜像）
 *  @param rootNode 根节点
 *  @return 翻转后的根节点（其实就是原二叉树的根节点）
 */

+(BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode
{
    if (!rootNode)return nil;
    if (!rootNode.leftNode&&!rootNode.rightNode) return rootNode;
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    BinaryTreeNode * tempNode = rootNode.leftNode;
    rootNode.leftNode =rootNode.rightNode;
    rootNode.rightNode =tempNode;
    return rootNode;
}


#pragma mark  --遍历二叉树
//先序遍历
+(void)treeFirstInformationWithNode:(BinaryTreeNode *)rootNode reslutBlock:(void (^)(NSInteger))block
{
    if (block) {
        block(rootNode.value);
    }
    if (rootNode.leftNode) {
        [self treeFirstInformationWithNode:rootNode.leftNode reslutBlock:block];
    }
    
    if (rootNode.rightNode) {
        [self treeFirstInformationWithNode:rootNode.rightNode reslutBlock:block];
    }

}

//中序遍历
+(void)treeMiddleInformationWithNode:(BinaryTreeNode *)rootNode reslutBlock:(void (^)(NSInteger))block
{
    if (rootNode.leftNode) {
        [self treeMiddleInformationWithNode:rootNode.leftNode reslutBlock:block];
    }
    
    if (block) {
        block(rootNode.value);
    }
    
    if (rootNode.rightNode) {
        [self treeMiddleInformationWithNode:rootNode.rightNode reslutBlock:block];
    }

}

+(void)treeLastInformationWithNode:(BinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger))block
{
    if (rootNode.leftNode) {
        [self treeMiddleInformationWithNode:rootNode.leftNode reslutBlock:block];
    }
    
    if (rootNode.rightNode) {
        [self treeMiddleInformationWithNode:rootNode.rightNode reslutBlock:block];
    }

    if (block) {
        block(rootNode.value);
    }
}

+(NSInteger)depathOfTree:(BinaryTreeNode *)rootNode
{
    if (!rootNode) return 0;
    if (!rootNode.leftNode && rootNode.rightNode) return 1;
    NSInteger leftDepth = [self depathOfTree:rootNode.leftNode];
    NSInteger rightDepth = [self depathOfTree:rootNode.rightNode];
    
    return  MAX(leftDepth, rightDepth)+1;
}

+(NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode
{
    if (!rootNode) return 0;
    return [self numberOfNodesInTree:rootNode.leftNode] +[self numberOfNodesInTree:rootNode.rightNode] + 1;

}

+(NSArray *)pathOfTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode
{
    NSMutableArray *pathArray = [NSMutableArray array];
    [self isFoundTreeNode:treeNode inTree:rootNode routePath:pathArray];
    return  pathArray;
}



#pragma mark  --Private
+(BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNode value:(NSInteger)value
{
    if (!treeNode) { //根节点不存在，创建节点
        treeNode = [BinaryTreeNode new];
        treeNode.value =value;
    }else if(value <=treeNode.value){
        treeNode.leftNode = [[self class] addTreeNode:treeNode.leftNode value:value];
    }else{
        treeNode.rightNode =[[self class] addTreeNode:treeNode.rightNode value:value];
    }
    return treeNode;
}


+(BOOL)isFoundTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode routePath:(NSMutableArray *)path
{
    if (!rootNode || !treeNode) {
        return NO;
    }
    //找到节点
    if (rootNode == treeNode) {
        [path addObject:rootNode];
        return YES;
    }
    //压入根节点，进行递归
    [path addObject:rootNode];
    //先从左子树中查找
    BOOL find = [self isFoundTreeNode:treeNode inTree:rootNode.leftNode routePath:path];
    //未找到，再从右子树查找
    if (!find) {
        find = [self isFoundTreeNode:treeNode inTree:rootNode.rightNode routePath:path];
    }
    //如果2边都没查找到，则弹出此根节点
    if (!find) {
        [path removeLastObject];
    }
    
    return find;
}

@end
