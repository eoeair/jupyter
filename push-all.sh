#!/bin/bash

# 登录镜像仓库（如需认证）
# podman login ghcr.io/eoeair/jupyter
set -e

IMAGE_NAME="ghcr.io/eoeair/jupyter"

# 获取所有镜像中名称为 $IMAGE_NAME 的 tag 列表
TAGS=$(podman images --format "{{.Repository}}:{{.Tag}}" | grep "^$IMAGE_NAME:")

if [ -z "$TAGS" ]; then
  echo "No tags found for image $IMAGE_NAME"
  exit 1
fi

# 循环推送每个 tag
for TAG in $TAGS; do
  echo "Pushing $TAG ..."
  podman image push "$TAG"
done

echo "All tags pushed successfully."
