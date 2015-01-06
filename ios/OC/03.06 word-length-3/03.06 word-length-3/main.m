//
//  main.m
//  03.06 word-length-3
//
//  Created by andyron on 15/1/7.
//  Copyright (c) 2015年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    FILE *wordFile = fopen("/tmp/words.txt", "r");
    char word[100];
    
    while (fgets(word,100,wordFile)) {
        word[strlen(word) - 1] = '\0';
        NSLog(@"%s is %lu characters long", word, strlen(word));
    }
    
    fclose(wordFile);
 
    return 0;
}
