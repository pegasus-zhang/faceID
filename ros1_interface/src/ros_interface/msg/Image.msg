Header   header     #  
uint32   height     #  
uint32   width     #  
string   encoding     #  
bool   is_bigendian     # # Is this data bigendian?
uint32   step     # # Full row length in bytes
uint8[] data # # actual matrix data, size is (step * rows)
