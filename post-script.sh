# Install helper libraries
mkdir ~/repos/HardCilk
cp -r /mnt/* ~/repos/HardCilk  
cd ~/repos/HardCilk/strenc-scala
sbt publishLocal
cd ~/repos/HardCilk/chisel3-interface/chisel3-interface
sbt publishLocal
cd
python3 -m pip install -e ~/repos/HardCilk/strenc-python
python3 -m pip install -e ~/repos/HardCilk/chisel3-interface/clients/python
python3 -m pip install -e ~/repos/HardCilk/systemc_helpers/python

# cd ~/strenc-scala
# sbt publishLocal
# cd ~/chisel3-interface/chisel3-interface
# sbt publishLocal
# cd
# python3 -m pip install -e ~/strenc-python
# python3 -m pip install -e ~/chisel3-interface/clients/python
# python3 -m pip install -e ~/systemc_helpers/python

# mkdir ~/HardCilk
# cp -r /code/* ~/HardCilk  
# cd ~/HardCilk/strenc-scala
# sbt publishLocal
# cd ~/HardCilk/chisel3-interface/chisel3-interface
# sbt publishLocal
# cd
# python3 -m pip install -e ~/HardCilk/strenc-python
# python3 -m pip install -e ~/HardCilk/chisel3-interface/clients/python
# python3 -m pip install -e ~/HardCilk/systemc_helpers/python