#include "dummy.hpp"

#include "gtest/gtest.h"

TEST(DummyTests, SampleTest) {
    for (auto i = 0; i < 10; ++i) {
        EXPECT_EQ(dummy(i), i + i);
    }
}