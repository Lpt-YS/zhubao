//
//  NakedDiamond.m
//  zhubao
//
//  Created by johnson on 14-5-28.
//  Copyright (c) 2014年 SUNYEARS___FULLUSERNAME. All rights reserved.
//

#import "NakedDiamond.h"

@interface NakedDiamond ()

@end

@implementation NakedDiamond

@synthesize primaryView;
@synthesize secondaryView;
@synthesize primaryShadeView;
@synthesize thridaryView;
@synthesize secondShadeView;
@synthesize fourtharyView;
@synthesize thirdShadeView;
@synthesize fivetharyView;
@synthesize weightmin;
@synthesize weightmax;
@synthesize pricemin;
@synthesize pricemax;
@synthesize DiamondNo;
@synthesize Nakeddisplay;
@synthesize titleLable;
@synthesize modelLable;
@synthesize productNoLable;
@synthesize weightLable;
@synthesize colorLable;
@synthesize netLable;
@synthesize cutLable;
@synthesize chasingLable;
@synthesize symmetryLable;
@synthesize depthLable;
@synthesize tableLable;
@synthesize sizeLable;
@synthesize fluorescenceLable;
@synthesize diplomaLable;
@synthesize priceLable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    shapearray = [[NSMutableArray alloc] init];
    colorarray = [[NSMutableArray alloc] init];
    netarray = [[NSMutableArray alloc] init];
    cutarray = [[NSMutableArray alloc] init];
    chasingarray = [[NSMutableArray alloc] init];
    symmetryarray = [[NSMutableArray alloc] init];
    fluorescencearray = [[NSMutableArray alloc] init];
    diplomaarray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doReg:(id)sender
{
    Index * _Index = [[Index alloc] init];
    
    [self.navigationController pushViewController:_Index animated:NO];
}

-(IBAction)doReg1:(id)sender
{
    product * _product = [[product alloc] init];
    
    [self.navigationController pushViewController:_product animated:NO];
}

-(IBAction)doReg2:(id)sender
{
    ustomtailor * _ustomtailor = [[ustomtailor alloc] init];
    
    [self.navigationController pushViewController:_ustomtailor animated:NO];
}

-(IBAction)doReg3:(id)sender
{
    diploma * _diploma = [[diploma alloc] init];
    
    [self.navigationController pushViewController:_diploma animated:NO];
}

-(IBAction)doReg4:(id)sender
{
    member * _member = [[member alloc] init];
    
    [self.navigationController pushViewController:_member animated:NO];
}

- (IBAction)goAction:(id)sender
{
    primaryShadeView.alpha=0.5;
    secondaryView.frame = CGRectMake(140, 95, secondaryView.frame.size.width, secondaryView.frame.size.height);
    secondaryView.hidden = NO;
    sqlService *product=[[sqlService alloc] init];
    productlist=[product GetProductdiaList:@"1" type2:@"1" type3:@"1" type4:@"1" type5:@"1" type6:@"1" type7:@"1" type8:@"1" type9:@"1" type10:@"1" type11:@"1" page:1 pageSize:10];
}

- (IBAction)closeAction:(id)sender
{
    secondaryView.hidden = YES;
    primaryShadeView.alpha=0;
}

- (IBAction)goAction1:(id)sender
{
    secondShadeView.alpha=0.5;
    thridaryView.frame = CGRectMake(140, 95, thridaryView.frame.size.width, thridaryView.frame.size.height);
    thridaryView.hidden = NO;
    titleLable.text=@"string";
    modelLable.text=@"string";
    productNoLable.text=@"string";
    weightLable.text=@"string";
    colorLable.text=@"string";
    netLable.text=@"string";
    cutLable.text=@"string";
    chasingLable.text=@"string";
    symmetryLable.text=@"string";
    depthLable.text=@"string";
    tableLable.text=@"string";
    sizeLable.text=@"string";
    fluorescenceLable.text=@"string";
    diplomaLable.text=@"string";
    priceLable.text=@"string";
}

- (IBAction)closeAction1:(id)sender
{
    thridaryView.hidden = YES;
    secondShadeView.alpha=0;
}

- (IBAction)goAction2:(id)sender
{
    thirdShadeView.alpha=0.5;
    fourtharyView.frame = CGRectMake(140, 95, fourtharyView.frame.size.width, fourtharyView.frame.size.height);
    fourtharyView.hidden = NO;
}

- (IBAction)closeAction2:(id)sender
{
    fourtharyView.hidden = YES;
    thirdShadeView.alpha=0;
}

//设置页面跳转
-(IBAction)setup:(id)sender
{
    fivetharyView.hidden=NO;
    fivetharyView.frame=CGRectMake(750, 70, fivetharyView.frame.size.width, fivetharyView.frame.size.height);
}
//设置页面关闭
-(IBAction)closesetup:(id)sender
{
    fivetharyView.hidden=YES;
}

//初始化tableview数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productlist count];
    //只有一组，数组数即为行数。
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"NakedCell";
    
    NakedCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        NSArray * nib=[[NSBundle mainBundle]loadNibNamed:@"NakedCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    for (productdia *entity in productlist) {
        cell.prodectimageview.image=[UIImage imageNamed:@"diamond01"];
        cell.modellable.text=entity.Dia_Shape;
        cell.numberlable.text=entity.Dia_Corp;
        cell.weightlable.text=entity.Dia_Carat;
        cell.colorlable.text=entity.Dia_Col;
        cell.netlable.text=entity.Dia_Clar;
        cell.cutlable.text=entity.Dia_Cut;
        cell.chasinglable.text=@"cc";
        cell.symmetrylable.text=entity.Dia_Sym;
        cell.diplomalable.text=entity.Dia_Lab;
        cell.pricelable.text=entity.Dia_Price;
    }
    cell.chasinglable.text=@"cc";
    return cell;
}

//tableview点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *rowString = [self.list objectAtIndex:[indexPath row]];
    //Nakeddisplay.hidden=YES;
}

//选择形状
-(IBAction)shapeselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * shape=nil;
    if (btntag==0) {
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        shape=@"RB";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        shape=@"PE";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        shape=@"EM";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==4){
        shape=@"RD";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==5){
        shape=@"OL";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==6){
        shape=@"MQ";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==7){
        shape=@"CU";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==8){
        shape=@"PR";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==9){
        shape=@"HT";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==10){
        shape=@"ASH";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    if (shape) {
        NSUInteger len=[shapearray count];
        NSUInteger i;
        BOOL isequal=NO;
        for (i=0; i<len; i++) {
            NSString * value=[shapearray objectAtIndex:i];
            isequal = [shape isEqualToString:value];
            if (isequal) {
                [shapearray removeObjectAtIndex:i];
                [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
                i=len;
            }
        }
        if (!isequal) {
            [shapearray addObject:shape];
        }
    }
}

// 选择颜色
-(IBAction)colorselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * color=nil;
    if (btntag==0) {
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        color=@"D";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        color=@"E";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        color=@"F";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==4){
        color=@"G";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==5){
        color=@"H";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==6){
        color=@"I";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==7){
        color=@"J";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==8){
        color=@"K";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==9){
        color=@"L";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==10){
        color=@"M";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    if (color) {
        NSUInteger len=[colorarray count];
        NSUInteger i;
        BOOL isequal=NO;
        for (i=0; i<len; i++) {
            NSString * value=[colorarray objectAtIndex:i];
            isequal = [color isEqualToString:value];
            if (isequal) {
                [colorarray removeObjectAtIndex:i];
                [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
                i=len;
            }
        }
        if (!isequal) {
            [colorarray addObject:color];
        }
    }
}
// 选择净度
-(IBAction)netselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * net=nil;
    if (btntag==0) {
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        net=@"FL";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        net=@"IF";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        net=@"VVS1";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==4){
        net=@"VVS2";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==5){
        net=@"VS1";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==6){
        net=@"VS2";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==7){
        net=@"SI1";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==8){
        net=@"SI2";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==9){
        net=@"I1";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==10){
        net=@"I2";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    if (net) {
        NSUInteger len=[netarray count];
        NSUInteger i;
        BOOL isequal=NO;
        for (i=0; i<len; i++) {
            NSString * value=[netarray objectAtIndex:i];
            isequal = [net isEqualToString:value];
            if (isequal) {
                [netarray removeObjectAtIndex:i];
                [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
                i=len;
            }
        }
        if (!isequal) {
            [netarray addObject:net];
        }
    }
}

//选择切工
-(IBAction)cutselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * cut=nil;
    if (btntag==0) {
        cut=@"EX";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        cut=@"VG";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        cut=@"GD";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        cut=@"Fair";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    NSUInteger len=[cutarray count];
    NSUInteger i;
    BOOL isequal=NO;
    for (i=0; i<len; i++) {
        NSString * value=[cutarray objectAtIndex:i];
        isequal = [cut isEqualToString:value];
        if (isequal) {
            [cutarray removeObjectAtIndex:i];
            [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
            i=len;
        }
    }
    if (!isequal) {
        [cutarray addObject:cut];
    }
}

//选择抛光
-(IBAction)chasingselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * chasing=nil;
    if (btntag==0) {
        chasing=@"EX";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        chasing=@"VG";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        chasing=@"GD";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        chasing=@"Fair";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    NSUInteger len=[chasingarray count];
    NSUInteger i;
    BOOL isequal=NO;
    for (i=0; i<len; i++) {
        NSString * value=[chasingarray objectAtIndex:i];
        isequal = [chasing isEqualToString:value];
        if (isequal) {
            [chasingarray removeObjectAtIndex:i];
            [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
            i=len;
        }
    }
    if (!isequal) {
        [chasingarray addObject:chasing];
    }
}

//选择对称
-(IBAction)symmetryselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * symmetry=nil;
    if (btntag==0) {
        symmetry=@"EX";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        symmetry=@"VG";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        symmetry=@"GD";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        symmetry=@"Fair";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    NSUInteger len=[symmetryarray count];
    NSUInteger i;
    BOOL isequal=NO;
    for (i=0; i<len; i++) {
        NSString * value=[symmetryarray objectAtIndex:i];
        isequal = [symmetry isEqualToString:value];
        if (isequal) {
            [symmetryarray removeObjectAtIndex:i];
            [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
            i=len;
        }
    }
    if (!isequal) {
        [symmetryarray addObject:symmetry];
    }
}

//选择荧光
-(IBAction)fluorescenceselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * fluorescence=nil;
    if (btntag==0) {
        fluorescence=@"N";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        fluorescence=@"F";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        fluorescence=@"M";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        fluorescence=@"S";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==4){
        fluorescence=@"VS";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    NSUInteger len=[fluorescencearray count];
    NSUInteger i;
    BOOL isequal=NO;
    for (i=0; i<len; i++) {
        NSString * value=[fluorescencearray objectAtIndex:i];
        isequal = [fluorescence isEqualToString:value];
        if (isequal) {
            [fluorescencearray removeObjectAtIndex:i];
            [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
            i=len;
        }
    }
    if (!isequal) {
        [fluorescencearray addObject:fluorescence];
    }
}

//选择证书
-(IBAction)diplomaselect:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSInteger btntag=[btn tag];
    NSString * diploma=nil;
    if (btntag==0) {
        diploma=@"GIA";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==1){
        diploma=@"IGI";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==2){
        diploma=@"NGTC";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==3){
        diploma=@"HRD";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==4){
        diploma=@"EGL";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }else if (btntag==5){
        diploma=@"Other";
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    }
    NSUInteger len=[diplomaarray count];
    NSUInteger i;
    BOOL isequal=NO;
    for (i=0; i<len; i++) {
        NSString * value=[diplomaarray objectAtIndex:i];
        isequal = [diploma isEqualToString:value];
        if (isequal) {
            [diplomaarray removeObjectAtIndex:i];
            [btn setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
            i=len;
        }
    }
    if (!isequal) {
        [diplomaarray addObject:diploma];
    }
}

//加入购物车
-(IBAction)addshopcart:(id)sender{
    NSString *rowString =@"成功加入购物车！";
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:rowString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}

@end
