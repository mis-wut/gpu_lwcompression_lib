#pragma once

template < typename T, char CWARP_SIZE >
__forceinline__ __host__ __device__ void set_cmp_offset(const unsigned int tid, const unsigned int bid, const unsigned char bit_length, unsigned long &data_id, unsigned long &cdata_id)
{
    const unsigned int warp_lane = tid % CWARP_SIZE;
    const unsigned long data_block = bid + tid - warp_lane;
    data_id = data_block * CWORD_SIZE(T) + warp_lane;
    cdata_id = data_block * bit_length + warp_lane;
}

