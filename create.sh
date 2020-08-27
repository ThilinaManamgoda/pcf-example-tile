#!/usr/bin/env bash
    
# Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

test -f loop-bosh-release.tgz && rm loop-bosh-release.tgz

pushd bosh-release
bosh create-release --tarball loop-bosh-release.tgz --force
popd

mv bosh-release/loop-bosh-release.tgz .

test -d product && rm -rf product
test -d release && rm -rf release

tile build
