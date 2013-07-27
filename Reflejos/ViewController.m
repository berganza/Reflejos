//
//  ViewController.m
//  Reflejos
//
//  Created by LLBER on 26/07/13.
//  Copyright (c) 2013 Berganza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage * imagen = [UIImage imageNamed:@"castillo de eilean donan.jpg"];
    
    CALayer * capaImagen = [CALayer layer];
    
    capaImagen.contents = (id) imagen.CGImage;
    capaImagen.bounds = CGRectMake(0, 0, imagen.size.width/5, imagen.size.height/5);
    capaImagen.position = CGPointMake(160, 150);
    
    //capaImagen.borderColor = [UIColor blackColor].CGColor;
    //capaImagen.borderWidth = 1.0;
    
    [self.view.layer addSublayer:capaImagen];
    
    // Capa reflejo
    CALayer *capaReflejo = [CALayer layer];
    
    capaReflejo.contents = (id) capaImagen.contents;
    
    capaReflejo.bounds = capaImagen.bounds;
    capaReflejo.position = CGPointMake(160, 151+capaImagen.frame.size.height);
    
    //capaReflejo.borderColor = capaImagen.borderColor;
    //capaReflejo.borderWidth = capaImagen.borderWidth;
   
    capaReflejo.opacity = 0.7; // No se usa alpha
    float angulo = 180*M_PI/180;
    [capaReflejo setValue:[NSNumber numberWithFloat:angulo] forKeyPath:@"transform.rotation.x"];
    

    
    
    // Añadir un gradiente al reflejo para el efecto de difuminarse
    CAGradientLayer * capaGradiente = [CAGradientLayer layer];
    
    capaGradiente.bounds = capaReflejo.bounds;
    capaGradiente.position = CGPointMake(capaReflejo.bounds.size.width/2, capaReflejo.bounds.size.height*0.75);
    capaGradiente.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor clearColor]CGColor],
                            (id)[[UIColor colorWithRed:0.600 green:0.682 blue:0.873 alpha:1.000]CGColor], nil];
    
    capaGradiente.startPoint = CGPointMake(0.5, 0.0);
    capaGradiente.endPoint = CGPointMake(0.5, 0.5);
    
    capaReflejo.mask = capaGradiente;
    
    
    [self.view.layer addSublayer:capaReflejo];
    
    
	}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
