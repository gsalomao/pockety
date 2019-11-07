/******************************************************************************
 * Copyright (C) 2019 Gustavo Santos Salomão
 * All rights reserved.
 *
 * This project cannot be copied and/or distributed without
 * the express permission of the author.
 *****************************************************************************/

#include <gtest/gtest.h>

class DummyUnitTest : public ::testing::Test {
};

TEST_F(DummyUnitTest, unitTestsAreOk) {
    ASSERT_TRUE(true);
}
