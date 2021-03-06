//
//  SharedTextureCache.m
//  pixelBloodSplatter
//
//  Created by Macbook on 22.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "SharedTextureCache.h"

@interface SharedTextureCache ()
@property (strong, nonatomic) NSMutableDictionary *textures;
@end

@implementation SharedTextureCache

+ (instancetype)sharedCache {
  static dispatch_once_t pred;
  static SharedTextureCache *sharedCache;
  dispatch_once(&pred, ^{
    sharedCache = [SharedTextureCache new];
  });
  return sharedCache;
}

- (id)init {
  if ((self = [super init])) {
    self.textures = [NSMutableDictionary dictionary];
  }
  return self;
}

- (SKTexture *)textureNamed:(NSString *)textureName {
  if ([textureName pathExtension]) {
    textureName = [textureName stringByDeletingPathExtension];
  }
  return self.textures[textureName];
}

- (void)addTexture:(SKTexture *)texture name:(NSString *)textureName {
  if ([textureName pathExtension]) {
    textureName = [textureName stringByDeletingPathExtension];
  }
  self.textures[textureName] = texture;
}

@end
