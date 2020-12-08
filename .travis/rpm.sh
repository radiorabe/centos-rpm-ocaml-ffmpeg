#!/bin/bash
#
# RPM build wrapper for ocaml-ffmpeg, runs inside the build container on travis-ci

set -xe

curl -o /etc/yum.repos.d/ocaml.repo "https://download.opensuse.org/repositories/home:/radiorabe:/liquidsoap:/ocaml/CentOS_8/home:radiorabe:liquidsoap:ocaml.repo"
#curl -o /etc/yum.repos.d/liquidsoap.repo "https://download.opensuse.org/repositories/home:/radiorabe:/liquidsoap/CentOS_8/home:radiorabe:liquidsoap.repo"

dnf install -y https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm

yum install -y ffmpeg-devel --enablerepo=PowerTools

chown root:root ocaml-ffmpeg.spec

build-rpm-package.sh ocaml-ffmpeg.spec
