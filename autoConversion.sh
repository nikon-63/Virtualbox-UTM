#!/bin/bash
ova_file=$(find . -maxdepth 1 -name "*.ova")
if [ -z "$ova_file" ]; then
    echo "Please place the .ova file in the current directory and try again."
    exit 1
else
    echo "Found .ova file: $ova_file"
fi

echo "Extracting $ova_file..."
tar -xvf "$ova_file"
wait

vmdk_file=$(find . -maxdepth 1 -name "*.vmdk")
if [ -z "$vmdk_file" ]; then
    echo "Failed to find .vmdk file. Please check the contents of the .ova file and try again."
    exit 1
else
    echo "Found .vmdk file: $vmdk_file"
fi

echo "Converting $vmdk_file to outPut.qcow2..."
qemu-img convert -O qcow2 "$vmdk_file" outPut.qcow2
wait

echo "Conversion complete."