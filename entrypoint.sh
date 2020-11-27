#!/bin/bash
#
# SPDX-FileCopyrightText: 2020 Max Reznik <reznikmm@gmail.com>
# SPDX-License-Identifier: MIT
#

set -e -x

do_user()
{
  su -l -c "$*" user
}

SPEC=${GITHUB_WORKSPACE}/$1
ls -l $SPEC
FILE=`grep ^Source0: $SPEC|sed -e 's/^.* //'`
echo FILE:$FILE
tar caf ~user/rpmbuild/SOURCES/$FILE --exclude-vcs -C ${GITHUB_WORKSPACE} .
dnf builddep --assumeyes --spec $SPEC
do_user spectool -g -R $SPEC

mkdir --mode=777 $GITHUB_WORKSPACE/x86_64
do_user rpmbuild -bb $SPEC --define "_rpmdir\ ${GITHUB_WORKSPACE}"
echo "::set-output name=RPM::`find $GITHUB_WORKSPACE/x86_64 -type f -printf %P:`"
