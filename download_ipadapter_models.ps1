# Save as download_ipadapter_models.ps1
# Run in PowerShell with: .\download_ipadapter_models.ps1

$baseDir = "C:\Comfyui\comfyui\models"

# Create directories if not exist
New-Item -ItemType Directory -Path "$baseDir\clip_vision" -Force | Out-Null
New-Item -ItemType Directory -Path "$baseDir\ipadapter" -Force | Out-Null

Write-Output "Downloading Clip Vision models..."
Invoke-WebRequest -Uri "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors" `
  -OutFile "$baseDir\clip_vision\CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors"

Invoke-WebRequest -Uri "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors" `
  -OutFile "$baseDir\clip_vision\CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors"

Write-Output "Downloading IPAdapter models..."

$ipadapterFiles = @{
  "ip-adapter_sd15.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors"
  "ip-adapter_sd15_light_v11.bin" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin"
  "ip-adapter-plus_sd15.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors"
  "ip-adapter-plus-face_sd15.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors"
  "ip-adapter-full-face_sd15.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors"
  "ip-adapter_sd15_vit-G.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors"
  "ip-adapter_sdxl_vit-h.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors"
  "ip-adapter-plus_sdxl_vit-h.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors"
  "ip-adapter-plus-face_sdxl_vit-h.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors"
  "ip-adapter_sdxl.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors"
  "ip-adapter_sd15_light.safetensors" = "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light.safetensors"
}

foreach ($file in $ipadapterFiles.GetEnumerator()) {
  Write-Output "Downloading $($file.Key)..."
  Invoke-WebRequest -Uri $file.Value -OutFile "$baseDir\ipadapter\$($file.Key)"
}

Write-Output "Downloading FaceID models..."

$faceidFiles = @{
  "ip-adapter-faceid_sd15.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin"
  "ip-adapter-faceid-plusv2_sd15.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin"
  "ip-adapter-faceid-portrait-v11_sd15.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin"
  "ip-adapter-faceid_sdxl.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin"
  "ip-adapter-faceid-plusv2_sdxl.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin"
  "ip-adapter-faceid-portrait_sdxl.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin"
  "ip-adapter-faceid-portrait_sdxl_unnorm.bin" = "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin"
}

foreach ($file in $faceidFiles.GetEnumerator()) {
  Write-Output "Downloading $($file.Key)..."
  Invoke-WebRequest -Uri $file.Value -OutFile "$baseDir\ipadapter\$($file.Key)"
}

Write-Output "All downloads finished successfully!"
