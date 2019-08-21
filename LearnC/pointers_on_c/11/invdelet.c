#include <stdlib.h>
#include "inventor.h"

void
discard_inventory_record( Invrec *record){
    switch( record->type ){
        case SUBASSY:
            free(record->info.subassy->part);
            free(record->info.subassy);
            break;
        case PART:
            free(record->info.part);
            break;
    }
    free(record);
}
