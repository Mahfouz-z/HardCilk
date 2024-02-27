# Install helper libraries
cp -r /mnt/* ~/repos/HardCilk  
python3 -m pip install -e ~/repos/HardCilk/strenc-python
python3 -m pip install -e ~/repos/HardCilk/chisel3-interface/clients/python
cd ~/repos/HardCilk/chisel3-interface/chisel3-interface
sbt publishLocal
cd ~/repos/HardCilk/strenc-scala
sbt publishLocal
cd