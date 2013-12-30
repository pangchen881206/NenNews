//
//  RootViewController.m
//  东北新闻网
//
//  Created by tenyea on 13-12-19.
//  Copyright (c) 2013年 佐筱猪. All rights reserved.
//

#import "RootViewController.h"
#import "Uifactory.h"
#import "FileUrl.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"东北新闻网";
    }
    return self;
}
//初始化tableview
-(NSArray *)_initUIView {
    
    
    NSMutableArray *arrays = [[NSMutableArray alloc]init];
    arrays = [[NSMutableArray alloc]init];
    for (int i =0; i<9; i++) {
        UILabel *view= [Uifactory createLabel:ktext sizeFont:20];
        NSString *content = [NSString stringWithFormat: @"content%dasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdfdasdfadfaasdf",i];
        view.text =content;
        view.numberOfLines = 0;
        CGSize size = [content sizeWithFont:view.font constrainedToSize:CGSizeMake(320, 1000)];
        view.frame = CGRectMake(0, 0, 320, 40);
        view.size =size;
        [arrays addObject: view];
    }
    return arrays;
}
//初始化按钮
-(NSArray *)_initButton {
    
    //读取全部显示菜单

    NSString *pathName = [[FileUrl getDocumentsFile] stringByAppendingPathComponent:column_show_file_name];
    NSMutableArray *nameArrays = [[NSMutableArray alloc]initWithContentsOfFile:pathName];
    return nameArrays;
    NSMutableArray *arrays = [[NSMutableArray alloc]init];
    for (int i =0; i<nameArrays.count; i++) {
//        UIButton *button =[[UIButton alloc]init];
//        [button setTitle:nameArrays[i] forState:UIControlStateNormal];
//        [button setTitleColor:NenNewsTextColor forState:UIControlStateNormal];
//        button.backgroundColor = NenNewsgroundColor;
        UIButton *button = [Uifactory createButton:[nameArrays[i] objectForKey:@"name"]];
        button.frame = CGRectMake(10 + 70*i, 0, 60, 30);
        [arrays addObject:button];
//        [button release];
    }
    return arrays;
}

-(void)_initNavagationbarButton {
    //添加状态栏按钮
    UIButton *leftButton = [[UIButton alloc]init];
    leftButton.backgroundColor=CLEARCOLOR;
    leftButton.frame=CGRectMake(0, 0, 20, 20);
    [leftButton setImage:[UIImage imageNamed:@"left_item_button.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setShowsTouchWhenHighlighted:YES];
    
    UIButton *rightButton = [[UIButton alloc]init];
    rightButton.backgroundColor=CLEARCOLOR;
    rightButton.frame=CGRectMake(0, 0, 20, 20);
    [rightButton setImage:[UIImage imageNamed:@"right_item_button.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= [leftitem autorelease];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= [rightItem autorelease];


}
#pragma mark UIScrollViewEventDelegate
-(void)addButtonAction{
    ColumnTabelViewController *columnVC = [[ColumnTabelViewController alloc]init];
    columnVC.eventDelegate = self;
    _po(self.navigationController);
    [self.navigationController pushViewController:columnVC animated:YES];
}
-(void)showRightMenu{
    [self.appDelegate.menuCtrl showRightController:YES];

}
-(void)showLeftMenu{
    [self.appDelegate.menuCtrl showLeftController:YES];

}
#pragma mark
#pragma mark UI
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initNavagationbarButton];

//    _sc  = [[BaseScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, ScreenHeight) andButtons:[self _initButton] andContents:[self _initUIView]];
    _sc = [[BaseScrollView alloc]initwithButtons:[self _initButton] WithFrame:CGRectMake(0, 0, 320, ScreenHeight)];
    _sc.eventDelegate = self;
    [self.view addSubview:_sc];

}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //    开启左滑、右滑菜单
    [self.appDelegate.menuCtrl setEnableGesture:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    //    禁用左滑、右滑菜单
    [self.appDelegate.menuCtrl setEnableGesture:NO];
    
}

#pragma mark 按钮事件
- (void)leftAction {
    [self.appDelegate.menuCtrl showLeftController:YES];
}
- (void)rightAction {
    [self.appDelegate.menuCtrl showRightController:YES];

}
#pragma mark columnchangeDelegate 
-(void)columnChanged:(NSArray *)array{
    _sc.buttonsNameArray = array;
}
#pragma mark 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)dealloc{
    RELEASE_SAFELY(_sc);
    [super dealloc];
}

@end
