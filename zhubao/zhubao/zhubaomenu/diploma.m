//
//  diploma.m
//  zhubao
//
//  Created by johnson on 14-5-29.
//  Copyright (c) 2014年 SUNYEARS___FULLUSERNAME. All rights reserved.
//

#import "diploma.h"

@interface diploma ()

@end

@implementation diploma

@synthesize primaryView;
@synthesize thirdView;
@synthesize fourthview;
@synthesize DiplomaSelect;
@synthesize selecttext;
@synthesize dipomaNoText;
@synthesize diamondWeightText;
@synthesize list = _list;
@synthesize dipomaIndex;
@synthesize selectText;
@synthesize shopcartcount;
@synthesize logoImage;
@synthesize checkpassword;

//证书类型
NSInteger diptype=-1;
//tableview分辨
NSInteger vvvv=0;

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
    NSArray *array = [[NSArray alloc] initWithObjects:@"GIA(美国宝石学院)", @"NGTC(国家珠宝玉石质量监督中心)",
                      @"IGI(世界宝石学院)", @"HRD(比利时钻石高阶层会议)", @"AGS(美国宝石学学会)", @"EGL(欧洲宝石学院)", nil];
    self.list = array;
    selecttext.userInteractionEnabled=NO;
    dipomaIndex.lineBreakMode = NSLineBreakByWordWrapping;
    dipomaIndex.hidden=YES;
    selectText.hidden=NO;
//    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
//    NSString *logopathsm = [[Tool getTargetFloderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"logopathsm.png"]];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:logopathsm]) {
//        [logoImage setImage:[[UIImage alloc] initWithContentsOfFile:logopathsm]];
//    }
//    else {
//        [logoImage setImage:[UIImage imageNamed:@"logo"]];
//    }
//    
//    NSString *goodscount=myDelegate.entityl.resultcount;
//    if (goodscount && ![goodscount isEqualToString:@""] && ![goodscount isEqualToString:@"0"]) {
//        shopcartcount.hidden=NO;
//        [shopcartcount setTitle:goodscount forState:UIControlStateNormal];
//    }else{
//        shopcartcount.hidden=YES;
//    }
    
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
    NakedDiamond * _NakedDiamond = [[NakedDiamond alloc] init];
    
    [self.navigationController pushViewController:_NakedDiamond animated:NO];
}

-(IBAction)doReg3:(id)sender
{
    ustomtailor * _ustomtailor = [[ustomtailor alloc] init];
    
    [self.navigationController pushViewController:_ustomtailor animated:NO];
}

-(IBAction)doReg4:(id)sender
{
    member * _member = [[member alloc] init];
    
    [self.navigationController pushViewController:_member animated:NO];
}

//购物车显示
- (IBAction)goAction:(id)sender
{
    shopcart *samplePopupViewController = [[shopcart alloc] initWithNibName:@"shopcart" bundle:nil];
    samplePopupViewController.mydelegate=self;
    
    [self presentPopupViewController:samplePopupViewController animated:YES completion:^(void) {
        NSLog(@"popup view presented");
    }];
}

-(void)closesc{
    if (self.popupViewController != nil) {
        [self dismissPopupViewControllerAnimated:YES completion:^{
            NSLog(@"popup view dismissed");
        }];
    }
}

//设置页面跳转
-(IBAction)setup:(id)sender
{
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
    {
        _settingupdate.frame = CGRectMake(10, 55, _settingupdate.frame.size.width, _settingupdate.frame.size.height);
        _settinglogout.frame = CGRectMake(10, 90, _settinglogout.frame.size.width, _settinglogout.frame.size.height);
        _settingsoftware.frame = CGRectMake(10, 20, _settingsoftware.frame.size.width, _settingsoftware.frame.size.height);
    }
    thirdView.hidden=NO;
    thirdView.frame=CGRectMake(750, 70, thirdView.frame.size.width, thirdView.frame.size.height);
}

//软件更新
-(IBAction)updatesofeware:(id)sender
{
    thirdView.hidden=YES;
    NSString *rowString =@"当前没有最新版本！";
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:rowString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}

//退出登录
-(IBAction)logout:(id)sender
{
    login * _login=[[login alloc] init];
    
    [self.navigationController pushViewController:_login animated:NO];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.entityl=[[LoginEntity alloc]init];
}

//更新数据
-(IBAction)updateProductDate:(id)sender
{
    @try {
        //可以在此加代码提示用户说正在加载数据中
//        NSString *rowString =@"正在更新数据。。。。";
//        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:rowString delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
//        [alter show];
        
        AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
        [myDelegate showProgressBar:self.view];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 耗时的操作（异步操作）
            
            AutoGetData * getdata=[[AutoGetData alloc] init];
            [getdata getDataInsertTable:0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //可以在此加代码提示用户，数据已经加载完毕
                
                [myDelegate stopTimer];
                
                //同步完数据了，则再去下载图片组
                //[getdata getAllZIPPhotos];
                [getdata getAllProductPhotos];
                
            });
        });
        thirdView.hidden=YES;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

//初始化tableview数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger value=0;
    value=[_list count];
    return value;
    //只有一组，数组数即为行数。
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 TableSampleIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:TableSampleIdentifier];
        }
        
        NSUInteger row = [indexPath row];
        cell.textLabel.text = [self.list objectAtIndex:row];
        return cell;
}

//tableview点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowString = [self.list objectAtIndex:[indexPath row]];
    diptype=[indexPath row];
    selecttext.text=rowString;
    selectText.hidden=YES;
    dipomaIndex.hidden=NO;
    if (diptype==0) {
        dipomaIndex.text=@"美国宝石学院是一家独立的非盈利性组织，作为世界上宝石界的权威，以它的公正而闻名。美国宝石学院(GIA)于 1931 年在洛杉矶成立，总部座落于洛杉矶，它创立并提出了国际分级体系。这个学院的突破性研究及其本身的教育、实验和设备开发过程几乎就是珠宝工业成长的编年史。GIA 在钻石分级和宝石鉴定方面为世界权威，GIA 钻石分级报告被认为是世界第一的宝石证书。各种大小的钻石都从世界各个角落送到 GIA 来进行分析分级。";
    }
    else if (diptype==1)
    {
        dipomaIndex.text=@"NGTC 全称为国家珠宝玉石质量监督检验中心，隶属于国土资源部珠宝玉石首饰管理中心，长期以来一直致力于珠宝职业教育和国家珠宝玉石标准的推广和普及工作。是国家质量监督检验检疫总局依法授权的国家级珠宝玉石专业质检机构, 先后通过了国家级的计量认证、中国实验室国家认可委员会的实验室ISO/IEC　17025认可、国家产品质量监督检验机构的审查认可，是国内珠宝玉石检测方面的权威机构。";
    }
    else if (diptype==2)
    {
        dipomaIndex.text=@"国际宝石学院座落于安特卫普，是最古老的宝石学院。1975 年在纽约、曼谷、孟买和东京分别建立了实验室。IGI 钻石报告从本质上说是一份声明，它借助世界认同的体系来验证钻石的真实性，提供可靠正确的钻石身份和级别。每颗钻石都经过几个有着丰富经验的鉴定师通过使用专业仪器分析来得到一个准确的钻石切工质量和特性描述。通过通俗易懂的语言来阐述钻石的详细信息。每颗钻石的级别和品质一般依据于 4C(克拉重量、颜色、净度和切工)作为分析结构记录在 IGI 钻石报告中。";
    }
    else if (diptype==3)
    {
        dipomaIndex.text=@"比利时钻石高阶层议会是官方认可的代表着比利时钻石商贸行业的机构。议会总部座落于世界钻石中心安特卫普。比利时钻石高阶层议会发布三种证书，其中 HRD 钻石证书也包含了完整的钻石品质描述，包括钻石的形状、重量、净度级别、荧光、颜色级别、规格和抛光级别。这些特有的品质决定了一个钻石的价值。";
    }
    else if (diptype==4)
    {
        dipomaIndex.text=@"美国宝石学学会通过严格的分级标准和提供详细信息来领导着行业。初级消费者可以借助简单的数字方法来理解钻石分级。钻石加工商和钻石批发商也使用美国宝石学学会钻石证书提供的详细钻石信息在世界上购买成批的钻石。";
    }
    else if (diptype==5)
    {
        dipomaIndex.text=@"成立于 1974 年，总裁是有地质学位的 Guy Margel，他在比利时开设了安特卫普第一所鉴定中心 EGL。并且以协助消费者购买钻石及贵宝石为使命。30 多年来，EGL 的客户以专业的批发商、零售商及切割工厂为主。EGL 也提供鉴定及教学服务，除此之外，还有钻石重车拋光，EGL 发出的证书足以提供该钻石所有的信息，包括了钻石的重量、颜色、净度、尺寸等物理性质，以供业界及消费者参考。在美国及比利时 EGL 鉴定有一定的专业地位和知名度。";
    }
    DiplomaSelect.hidden=YES;
}

//点击tableview以外得地方关闭
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    //点击其他地方消失
    if (!CGRectContainsPoint([DiplomaSelect frame], pt)) {
        //to-do
        DiplomaSelect.hidden=YES;
    }
    if (!CGRectContainsPoint([thirdView frame], pt)) {
        //to-do
        thirdView.hidden=YES;
    }
    
}

//证书下拉选择
- (IBAction)diplomaselect:(id)sender
{
    vvvv=0;
    DiplomaSelect.hidden=NO;
}


//证书查询浏览器页面跳转
//0为GIA，1为NGTC，2为IGI，3为HRD，4为AGS，5为EGL
-(IBAction)diplomasearch:(id)sender
{
    
    if(diptype<0){
        NSString *rowString =@"请选择证书类型！";
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:rowString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    NSString *dno=dipomaNoText.text;
    NSString *dw=diamondWeightText.text;
    if (![self isnull:dno]) {
        dno=@"";
    }
    if (![self isnull:dw]) {
        dw=@"";
    }
    
    if (diptype==0) {
        
        NSString *url=[NSString stringWithFormat:@"https://myapps.gia.edu/ReportCheckPortal/getReportData.do?&reportno=%@&weight=%@",dno,dw];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }else if (diptype==1){
        
        NSString *url=[NSString stringWithFormat:@"HTTP://seyuu.com/Unrelated/TurnTongtc.asp?reportno=%@&weight=%@",dno,dw];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }else if (diptype==2){
        NSString *url=[NSString stringWithFormat:@"HTTP://seyuu.com/Unrelated/TurnToIGI.asp?reportno=%@&weight=%@",dno,dw];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }else if (diptype==3){
        
        NSString *url=[NSString stringWithFormat:@"http://www.hrdantwerplink.be/?record_number=%@&weight=%@&L=",dno,dw];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }else if (diptype==4){
        
        NSString *url=[NSString stringWithFormat:@"http://agslab.com/reportTypes/dqr.php?StoneID=%@&Weight=%@&D=1",dno,dw];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }else if (diptype==5){
        
        NSString *url=[NSString stringWithFormat:@"http://www.eglusa.com/oresults/SearchPage3.php?st_num=%@",dno];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}


-(BOOL)isnull:(NSString *)str
{
    if (str && ![str isEqualToString:@""] && ![str isEqualToString:@"(null)"]) {
        return true;
    }else{
        return  false;
    }
}


@end
