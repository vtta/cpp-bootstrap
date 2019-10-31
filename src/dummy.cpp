#include "dummy.hpp"

static auto GLOBAL_DUMMY = 0;

int dummy(int d) { return d + GLOBAL_DUMMY++; }