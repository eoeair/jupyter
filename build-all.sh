#!/bin/bash

# 确保脚本在任何错误发生时立即退出
set -e

echo "🔧 构建 Base(py-c)..."
podman build \
  --build-arg DEBIAN_MIRROR=mirrors.ustc.edu.cn \
  --build-arg PYPI_MIRROR=https://mirrors.ustc.edu.cn/pypi/simple \
  -t ghcr.io/eoeair/jupyter:py-c python

echo "🔧 构建 SCIPY_C..."
podman build -t ghcr.io/eoeair/jupyter:scipy-c scipy/cpu

echo "🔧 构建 PYAI_C..."
podman build -t ghcr.io/eoeair/jupyter:pyai-c pyai/cpu

echo "🔧 构建 SQL..."
podman build -t ghcr.io/eoeair/jupyter:sql sql

echo "🔧 构建 CPP..."
podman build -t ghcr.io/eoeair/jupyter:cpp cpp

echo "🔧 构建 JULIA..."
podman build \
    --build-arg JULIA_MIRROR=https://mirrors.cernet.edu.cn/julia \
    -t ghcr.io/eoeair/jupyter:julia julia

echo "🔧 构建 NOVNC..."
podman build -t ghcr.io/eoeair/jupyter:novnc novnc

echo "🔧 构建 MATLAB_MINIMAL..."
podman build -t ghcr.io/eoeair/jupyter:matlab-minimal matlab/minimal

echo "🔧 构建 MATLAB_MCM"
podman build -t ghcr.io/eoeair/jupyter:matlab-mcm matlab/mcm

echo "✅ 所有构建完成！"