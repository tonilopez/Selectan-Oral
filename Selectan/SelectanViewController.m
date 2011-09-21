//
//  SelectanViewController.m
//  Selectan
//
//  Created by neorg on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SelectanViewController.h"

@implementation SelectanViewController

@synthesize paginasArray;
@synthesize scrollView;
@synthesize subview;

//---------------------------------------------------------------------------
// init
//---------------------------------------------------------------------------

- (void) inicio{
    
    numeroDePaginas = 6;
    isShowingLandscapeView = NO;
    
    paginasArray = [[NSMutableArray alloc] initWithCapacity: 6];
    
    [paginasArray insertObject: [NSArray arrayWithObjects: 
                                 [UIImage imageNamed:@"cover_v.jpg"],
                                 [UIImage imageNamed:@"page1_v.jpg"],
                                 [UIImage imageNamed:@"page2_v.jpg"],
                                 [UIImage imageNamed:@"page3_v.jpg"],
                                 [UIImage imageNamed:@"page4_v.jpg"], 
                                 [UIImage imageNamed:@"page5_v.jpg"],nil] atIndex: 0];
    
    [paginasArray insertObject: [NSArray arrayWithObjects: 
                                 [UIImage imageNamed:@"cover_h.jpg"],
                                 [UIImage imageNamed:@"page1_h.jpg"],
                                 [UIImage imageNamed:@"page2_h.jpg"],
                                 [UIImage imageNamed:@"page3_h.jpg"],
                                 [UIImage imageNamed:@"page4_h.jpg"], 
                                 [UIImage imageNamed:@"page5_h.jpg"],nil] atIndex: 1];
    
}

//---------------------------------------------------------------------------
// logo 
//---------------------------------------------------------------------------
/*
- (void)drawLogo:(float *)drawLogo parameters:(float *)x header:(float *)y {
    
    //float x = (scrollView.frame.origin.x * -1) ;
    //float y = 910;
    
    NSLog(@"add logo");
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];  
    logo.userInteractionEnabled = YES;  
    logo.autoresizingMask = ( UIViewAutoresizingFlexibleWidth );  
    logo.frame =  CGRectMake( x, y, 68, 68);
    
    [self.scrollView addSubview:logo];
    
    
}
 */

//---------------------------------------------------------------------------
// COVER
//---------------------------------------------------------------------------

- (void)drawCover{
    if (isShowingLandscapeView == NO){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 0];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 0];  
    }
    [self.scrollView addSubview:subview];
}

//---------------------------------------------------------------------------
// PAGINA 1
//---------------------------------------------------------------------------

- (void)drawPage1{
    
    int x = self.scrollView.frame.size.width * 1 ;
    int y = self.scrollView.frame.size.height;
    

    if (!isShowingLandscapeView){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 1];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 1];  
    }
    
    // logo
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];  
    logo.userInteractionEnabled = YES;  
    logo.autoresizingMask = ( UIViewAutoresizingFlexibleWidth );  
    logo.frame =  CGRectMake(x + 20, y - 88, 68, 68);
    
    [self.scrollView addSubview:subview];    
    [self.scrollView addSubview:logo];

}

//---------------------------------------------------------------------------
// PAGINA 2
//---------------------------------------------------------------------------

- (void)drawPage2{
    
    if (!isShowingLandscapeView){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 2];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 2];  
    }
    [self.scrollView addSubview:subview];
}


//---------------------------------------------------------------------------
// PAGINA 4
//---------------------------------------------------------------------------

- (void)drawPage3{
    if (!isShowingLandscapeView){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 3];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 3];  
    }
    [self.scrollView addSubview:subview];
}


//---------------------------------------------------------------------------
// PAGINA 4
//---------------------------------------------------------------------------

- (void)drawPage4{
    if (!isShowingLandscapeView){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 4];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 4];  
    }
    [self.scrollView addSubview:subview];
}


//---------------------------------------------------------------------------
// PAGINA 5
//---------------------------------------------------------------------------

- (void)drawPage5{
    if (!isShowingLandscapeView){
        subview.image = [[paginasArray objectAtIndex: 0] objectAtIndex: 5];
    }else{
        subview.image = [[paginasArray objectAtIndex: 1] objectAtIndex: 5];  
    }
    [self.scrollView addSubview:subview];
}


- (void) drawPages{
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * numeroDePaginas, self.scrollView.frame.size.height);
    
    for (int i = 0; i < numeroDePaginas; i++) {
        
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        subview = [[UIImageView alloc] initWithFrame:frame];
        
        
        switch (i) {
            case 0:
                [self drawCover];
                break;
            case 1:
                [self drawPage1];
                break;
            case 2:
                [self drawPage2];
                break;
            case 3:
                [self drawPage3];
                break;
            case 4:
                [self drawPage4];
                break;
            case 5:
                [self drawPage5];
                break;
            default:
                break;
        }
        
    }
    
    // posicionar scrollview tras cambio de orientación
    
    
    NSLog(@"Página actual %d.", page);
    
    CGRect frame = scrollView.frame;
    frame.origin.x = self.scrollView.frame.size.width *  page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        isShowingLandscapeView = YES;
        
    }
    else
    {
        isShowingLandscapeView = NO;
        
    }
    
    // limpiar los contenidos que puedan existir
    
    NSArray *subviews = [[scrollView subviews] copy];
    for (UIView *_subview in subviews) {
        [_subview removeFromSuperview];
    }
    
    [subviews release];
    
    [self drawPages];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    page  = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
}



- (void)dealloc
{
    [scrollView release];
    [subview release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    scrollView.delegate = self;
    [self inicio];
    [self drawPages];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
