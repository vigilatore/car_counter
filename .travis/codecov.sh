#!/bin/bash

# Get code converage.
cd ${TRAVIS_BUILD_DIR}
lcov --directory . --capture --output-file coverage.info # capture coverage info
lcov --remove coverage.info '/usr/*' --output-file coverage.info # filter out system
lcov --list coverage.info #debug info
bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports" # Uploading report to CodeCov
