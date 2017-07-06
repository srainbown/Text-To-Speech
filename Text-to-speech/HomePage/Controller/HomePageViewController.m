//
//  HomePageViewController.m
//  Text-to-speech
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import "HomePageViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface HomePageViewController ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) AVSpeechUtterance *utterance;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"主页";
    
    [self createUI];
    
}

#pragma mark -- 懒加载
-(AVSpeechSynthesizer *)synthesizer{
    if (_synthesizer == nil) {
        _synthesizer = [[AVSpeechSynthesizer alloc]init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}

-(AVSpeechUtterance *)utterance{
    if (_utterance == nil) {
        //设置需要转换的文字
        _utterance = [[AVSpeechUtterance alloc]initWithString:@"锦瑟无端五十弦，一弦一柱思华年。庄生晓梦迷蝴蝶，望帝春心托杜鹃。沧海月明珠有泪，蓝田日暖玉生烟。此情可待成追忆，只是当时已惘然。"];
        _utterance.rate = AVSpeechUtteranceDefaultSpeechRate;//设置语速，范围0~1，0最慢，1最快
//        _utterance.pitchMultiplier = 2.0f;//高音 0~2
//        _utterance.postUtteranceDelay = 0.1f;//播放本语句前的暂停时间
//        _utterance.postUtteranceDelay = 0.1f;//播放下一语句的暂停时间
        
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置发音，中文
        _utterance.voice = voice;
    }
    return _utterance;
}


#pragma mark -- UI
-(void)createUI{
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"讲" forState:UIControlStateNormal];
    [btn setTitle:@"停" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor orangeColor].CGColor;
    [btn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.centerX);
        make.top.mas_equalTo(self.view).offset(84);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
}

-(void)startClick:(UIButton *)sender{
    if(sender.selected == NO){
        sender.selected = !sender.selected;
        if ([self.synthesizer isPaused]) {
            //恢复播放
            [self.synthesizer continueSpeaking];
        }else{
            //开始;
            [self.synthesizer speakUtterance:self.utterance];
        }
    }else{
        sender.selected = !sender.selected;
        //取消播放
//        [self.Synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        //暂停播放，会保存进度
        [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
//        AVSpeechBoundaryImmediate,  立即停
//        AVSpeechBoundaryWord  说完一个整词再停
    }
    
}

#pragma mark -- AVSpeechSynthesizerDelegate
-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(nonnull AVSpeechUtterance *)utterance{
    NSLog(@"*****开始播放*****");
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(nonnull AVSpeechUtterance *)utterance{
    NSLog(@"*****暂停播放*****");
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(nonnull AVSpeechUtterance *)utterance{
    NSLog(@"*****恢复播放*****");
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(nonnull AVSpeechUtterance *)utterance{
    NSLog(@"*****取消播放*****");
}


@end
