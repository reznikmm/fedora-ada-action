# SPDX-FileCopyrightText: 2020 Max Reznik <reznikmm@gmail.com>
# SPDX-License-Identifier: MIT
#

FROM fedora
RUN curl -o /etc/yum.repos.d/bintray-reznikmm-matreshka.repo \
 https://bintray.com/reznikmm/matreshka/rpm && \
 dnf --assumeyes install rpmdevtools && \
 dnf --assumeyes install dnf-plugins-core && \
 dnf --assumeyes install gcc-gnat && \
 dnf --assumeyes install gprbuild && \
 dnf --assumeyes install make && \
useradd user && \
su -c rpmdev-setuptree user
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
