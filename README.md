# Virtualbox-UTM
Method to convert .ova files to .qcow2 files that can be used with UTM on Apple Silicon chips.

## Requirements
```
brew install qume
```

## Conversion
### Manual Conversion
__Extract .ova file__
```
tar -xvf <.ova File>
```

**Convert to .qcow2**
```
qemu-img convert -O qcow2 <Generated vmdk file> <qcow2 Output File>
```
