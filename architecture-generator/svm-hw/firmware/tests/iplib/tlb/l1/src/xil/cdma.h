#ifndef CDMA_H_INCLUDED
#define CDMA_H_INCLUDED

int cdma_initialize();
int cdma_simple_transfer(void const *src, void *dest, int len);
int cdma_wait_busy();

#endif // CDMA_H_INCLUDED
