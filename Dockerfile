# SPDX-FileCopyrightText: 2020-2023 Max Reznik <reznikmm@gmail.com>
# SPDX-License-Identifier: MIT
#

FROM fedora:36
RUN curl -o /etc/yum.repos.d/reznik-ada.repo \
 https://copr.fedorainfracloud.org/coprs/reznik/ada/repo/fedora-36/reznik-ada-fedora-36.repo && \
 dnf --assumeyes install rpmdevtools && \
 dnf --assumeyes install dnf-plugins-core && \
 dnf --assumeyes install fedora-gnat-project-common && \
 dnf --assumeyes install gcc-gnat && \
 dnf --assumeyes install gprbuild && \
 dnf --assumeyes install make && \
useradd --uid 1001 user && \
su -c rpmdev-setuptree user
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
