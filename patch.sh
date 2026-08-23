#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to the specific multi-scale deformable attention directory
cd "$BASE_DIR/groundingdino/models/GroundingDINO/csrc/MsDeformAttn"

# Replace the deprecated value.type() with value.scalar_type()
sed -i 's/value.type()/value.scalar_type()/g' ms_deform_attn_cuda.cu

# Update the legacy .is_cuda() checking logic
sed -i 's/value.scalar_type().is_cuda()/value.is_cuda()/g' ms_deform_attn_cuda.cu