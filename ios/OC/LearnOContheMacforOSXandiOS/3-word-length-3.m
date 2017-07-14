#import <Foundation/Foundation.h>

int int main(int argc, char const *argv[])
{
	FILE *wordFile = fopen("/tmp/words.txt","r");
	char word[100];
	while(fgets(word, 100, wordFile)){
		word[strlen(word) - 1] = '\0';

		NSLog(@"%s is %lu characters long", word, strlen(word));
	}
	fclose(wordFile);
	return 0;
}