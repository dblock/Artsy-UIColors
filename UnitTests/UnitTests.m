//
//  UnitTests.m
//  UnitTests
//
//  Created by Orta on 06/19/2014.
//  Laura says these are redundant, and I mostly agree.
//  However I'd feel guilty making changes without it.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#define EXP_SHORTHAND
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <EXPMatchers+FBSnapshotTest/EXPMatchers+FBSnapshotTest.h>

#import <Artsy+UIColors/UIColor+ArtsyColors.h>
#import <Artsy+UIColors/UIColor+DebugColours.h>

SpecBegin(UnitTests)

__block UIView *sut;

beforeEach(^{
    sut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
});

it(@"purple looks purple", ^{
    sut.backgroundColor = [UIColor artsyPurple];
    expect(sut).to.haveValidSnapshot();
});

it(@"purple with alpha is a bit off colour", ^{
    sut.backgroundColor = [UIColor artsyPurpleWithAlpha:0.5];
    expect(sut).to.haveValidSnapshot();
});

it(@"heavy grey looks heavy", ^{
    sut.backgroundColor = [UIColor artsyHeavyGrey];
    expect(sut).to.haveValidSnapshot();
});

it(@"medium grey is about middle", ^{
    sut.backgroundColor = [UIColor artsyMediumGrey];
    expect(sut).to.haveValidSnapshot();
});

it(@"light grey is about grey", ^{
    sut.backgroundColor = [UIColor artsyLightGrey];
    expect(sut).to.haveValidSnapshot();
});

it(@"red is well red", ^{
    sut.backgroundColor = [UIColor artsyRed];
    expect(sut).to.haveValidSnapshot();
});

it(@"attention is obvious", ^{
    sut.backgroundColor = [UIColor artsyAttention];
    expect(sut).to.haveValidSnapshot();
});

describe(@"debug", ^{
    it(@"blue is aesthetically pleasing", ^{
        sut.backgroundColor = [UIColor debugColourBlue];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"puple is exceedingly purple", ^{
        sut.backgroundColor = [UIColor debugColourPurple];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"red rocks", ^{
        sut.backgroundColor = [UIColor debugColourRed];
        expect(sut).to.haveValidSnapshot();
    });
    
    it(@"green fits nicely with the rest", ^{
        sut.backgroundColor = [UIColor debugColourGreen];
        expect(sut).to.haveValidSnapshot();
    });
    
    it(@"random doesnt give the same result twice", ^{
        UIColor *oneColor = [UIColor debugColourRandom];
        UIColor *twoColor = [UIColor debugColourRandom];

        const CGFloat *oneComponents = CGColorGetComponents(oneColor.CGColor);
        const CGFloat *twoComponents = CGColorGetComponents(twoColor.CGColor);
        
        BOOL isTheSame = (
            (oneComponents[0] == twoComponents[0]) &&
            (oneComponents[1] == twoComponents[1]) &&
            (oneComponents[2] == twoComponents[2])
        );
        expect(isTheSame).to.beFalsy();

    });
});


SpecEnd