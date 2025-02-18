Header   header     #  
uint32   height     #  
uint32   width     #  
PointField[] fields # # Describes the channels and their layout in the binary data blob.
bool   is_bigendian     # # Is this data bigendian?
uint32   point_step     # # Length of a point in bytes
uint32   row_step     # # Length of a row in bytes
uint8[] data # # Actual point data, size is (row_step*height)
bool   is_dense     # # True if there are no invalid points
