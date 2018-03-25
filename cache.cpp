/*
 * Actual data storing, data movement and LRU policy not implemented
 * For LRU: for every index we can have a 6 bit counter and every set have a LRU register, when there is a access to a set of an index the counter value of the index is incremented and copied to the LRU register of the set. At the time of replacement, cache block with smallest LRU value of the index get replaced.  
 * */
#include <iostream>
#include <cassert>
#include <cstdlib>
#include <ctime>

#define HIT 1
#define MISS 0

using namespace std;

class Cache {
  private:
   int set, asso, LS;
   int hit_counter,miss_counter;
   int **TAG;
  public:
   int get_hit(void){return hit_counter;}
   int get_miss(void){return miss_counter;}
   Cache(){}
   void CacheInit( int sets, int associativity, int LineSize ) {
	int i, j;
	TAG = new int*[sets];
	for(i = 0; i < sets; i++)
 	  TAG[i] = new int [associativity];
	assert( TAG != NULL );
	/* Initialize tag to be -1 */
	for(i=0;i<sets;i++)
	  for(j=0;j<associativity;j++) TAG[i][j]=-1;
	/*cout << TAG[5][3] << endl;*/
	asso = associativity; set = sets; LS = LineSize;
	hit_counter=miss_counter=0;
	}
   ~Cache(void){delete[] TAG;}
    int Access(unsigned int Address) {
	int i, x;
	int offset = Address % LS;
	int index = (Address/LS) % set;
	int Tag = (Address/LS)/set;
	/*if hit*/
	for(i = 0; i < asso; i++)
		if( TAG[index][i] == Tag) {
  		  hit_counter++;
		  return HIT;
		}
	miss_counter++;
	/*miss*/
	x = rand() % asso; /*used random policy for replacement, You have to LRU policy*/
	TAG[index][x] = Tag;
	return MISS;
	} 
};


int main()
{
	int L1_hit_count,L1_miss_count, hit;
	unsigned int Address;
	int j, Time, i =0;
	int MaxAddress=1<<16;

	Cache L1;
	Cache L2;
	L1.CacheInit(128, 4, 32);
	L2.CacheInit(512, 8, 64);
	srand(time(NULL));
	for(Time = 0; Time < 20000; Time++) {
		Address = rand()%MaxAddress;
		//cout << Address << endl; 
		hit = L1.Access(Address);
		if(!hit) {
			hit = L2.Access(Address);
		}
	}/*end for loop*/

	cout<<"\nL1: hit "<<L1.get_hit()<<" miss "<<L1.get_miss();
	cout<<"\nL2: hit "<<L2.get_hit()<<" miss "<<L2.get_miss();

	cout<<"\n\nMy work is done\n\n";
	return 0;
}

