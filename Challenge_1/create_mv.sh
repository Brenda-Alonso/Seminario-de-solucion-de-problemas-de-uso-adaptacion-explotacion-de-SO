#!/bin/bash

if [ "$#" -ne 8 ]; then
        echo "Uso: $0 <nombre_vm> <tipo_os> <num_cpu> <mem_ram> <mem_vram> <tam_disco> <nombre_controlador_sata> <nombr>
        exit 1
fi

NOMBRE_VM=$1
TIPO_OS=$2
NUM_CPU=$3
MEM_RAM=$4
MEN_VRAM=$5
TAM_DISCO=$6
CONTROLADOR_SATA=$7
CONTROLADOR_IDE=$8

RUTA_DISCO="${HOME}/Virtualbox VMs/${NOMBRE_VM}/${NOMBRE_VM}.vdi"

VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_OS" --register

VBoxManage modifyvm "$NOMBRE_VM" --memory "$MEM_RAM" --vram "$MEM_VRAM"

VBoxManage modifyvm "$NOMBRE_VM" --cpus "$NUM_CPU"

VBoxManage createmedium disk --filename "$RUTA_DISCO" --size "$TAM_DISCO" --format VDI

VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_SATA" --add sata --controller IntelAhci

VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "$RUTA_D>

VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_IDE" --add ide


echo "configuracion de la maquina virtual $NOMBRE_VM:"
VBoxManage showvminfo "$NOMBRE_VM"