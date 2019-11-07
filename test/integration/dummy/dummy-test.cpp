/******************************************************************************
 * Copyright (C) 2019 Gustavo Santos Salomão
 * All rights reserved.
 *
 * This project cannot be copied and/or distributed without
 * the express permission of the author.
 *****************************************************************************/

#include <gtest/gtest.h>

class DummyIntegrationTest : public ::testing::Test {
};

TEST_F(DummyIntegrationTest, integrationTestsAreOk) {
    ASSERT_TRUE(true);
}
