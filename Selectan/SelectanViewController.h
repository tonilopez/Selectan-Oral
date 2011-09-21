//
//  SelectanViewController.h
//  Selectan
//
//  Created by neorg on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SelectanViewController : UIViewController <UIScrollViewDelegate>{
    
    int numeroDePaginas;
    int page;
    
    BOOL isShowingLandscapeView;
    
    NSMutableArray  *paginasArray ;
    UIImageView* subview;
    UIScrollView* scrollView;

}

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIImageView* subview;
@property (nonatomic, retain) NSMutableArray  *paginasArray ;

@end
