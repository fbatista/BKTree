# A BK Tree implementation for iOS

In order to use this implementation, you will need to have your object comply with the BKHashableValue protocol

After that, create a BKTree object and use it's interface to add BKNodes and search objects on the tree.

	
	BKTree * tree = [[BKTree alloc] init];

	//insertion
	[tree insertValue:suitable_object];

	//search for results
	//threshold signifies the maximum metric distance allowed while traversing the tree
	//lower values means faster and less results
	NSMutableArray * results = [find:candidate withThreshold:20];


When implementing your BKHashableValue object, keep in mind that:

	//these 2 methods should be backed up by an ivar or property. They are used internally by the BKTree and you can use them after a find operation returns search results, in order to view / debug the scores.
	- (void)setScore:(NSUInteger)score;
	- (NSUInteger)getScore;
	
	//this method implements the Metric distance algorithm that will compare 2 objects.
	- (NSUInteger)distanceToValue:(id<BKHashableValue>)candidate;


TODO:
Node removal.