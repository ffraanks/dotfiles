# Arch Linux Install

Esse é o meu guia de instalação, não recomendo que você siga a não ser que saiba o que está fazendo, quer instalar o Arch Linux, siga o [Guia de Instalação](https://wiki.archlinux.org/index.php/Installation_guide_(Portugu%C3%AAs))

### Layout do Teclado ABNT2:

```
loadkeys br-abnt2
```

### Mudar o tamanho da fonte:

```
setfont lat4-19
```

### Partições:

```
cfdisk
```

### Formatar partições:

```
mkfs.fat -F32 /dev/sda1
mkfs.btrfs -f /dev/sda2
```

### Criando subvolumes do btrfs:

#### OBS: Para mais informações sobre BTRFS veja o [tutorial](https://www.notion.so/Criando-Em-BTRFS-e9055826f34b40198e47c10c14b73a11) do José Rafael. 

```
mount /dev/sda2 /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@snapshots
umount /mnt
```

#### OBS:Se você for usar muitos snapshots separe o var do subvolume principal (@) e caso use  banco de dados e maquinas virtuais remova o CoW do subvolume @var depois de cria-lo com o comando chattr:

```
# chattr +C /mnt/@var
```

### OBS: O compress tem três tipos:

- zlib
- lzo
- zstd

Você pode pesquisar qual seja melhor para você clicando [aqui.](https://btrfs.wiki.kernel.org/index.php/Compression#What_are_the_differences_between_compression_methods.3F)

### Montando os supervolumes:

- SSD

```
# mount -o defaults,noatime,discard,compress=lzo,ssd,space_cache,subvol=@ /dev/sda2 /mnt
# mkdir -p /mnt/boot/efi
# mkdir /mnt/home
# mkdir /mnt/var
# mkdir /mnt/.snapshots
# mount -o defaults,noatime,discard,compress=lzo,ssd,space_cache,subvol=@home /dev/sda2 /mnt/home
# mount -o defaults,noatime,discard,compress=lzo,ssd,space_cache,subvol=@var /dev/sda2 /mnt/var
# mount -o defaults,noatime,discard,compress=lzo,ssd,space_cache,subvol=@snapshots /dev/sda2 /mnt/.snapshots
# mount /dev/sda1 /mnt/boot/efi
```

- HDD

```
# mount -o defaults,compress=lzo,nossd,autodefrag,subvol=@ /dev/sda2 /mnt
# mkdir -p /mnt/boot/efi
# mkdir /mnt/home
# mkdir /mnt/var
# mkdir /mnt/.snapshots
# mount -o defaults,compress=lzo,nossd,autodefrag,subvol=@home /dev/sda2 /mnt/home
# mount -o defaults,compress=lzo,nossd,autodefrag,subvol=@var /dev/sda2 /mnt/var
# mount -o defaults,compress=lzo,nossd,autodefrag,subvol=@snapshots /dev/sda2 /mnt/.snapshots
# mount /dev/sda1 /mnt/boot/efi
```

#### OBS: Para caso de /home separada:

```
mkfs.ext4 /dev/sda3 
mkdir /mnt/home && mount /dev/sda3
```

### Instalar os pacotes base:

```
pacstrap /mnt base dhcpcd neovim linux-firmware base-devel
```

### Fstab:

```
genfstab /mnt >> /mnt/etc/fstab
```

### Entrar no chroot:

```
arch-chroot /mnt
```

### Habilitar rede dhcpcd:

```
systemctl enable dhcpcd
```

### Definir o fuso horário do sistema:

```
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc
timedatectl set-ntp true
```

### Alterando o idioma do sistema:

```
nvim /etc/locale.gen
Descomenta a linha: #pt_BR.UTF-8
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
export LANG=pt_BR.UTF-8
```

### Configurar o teclado para subir em PT-BR:

```
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
```

### Colocar nome host:

```
echo frank > /etc/hostname ou echo arch > /etc/hostname
```

### Btrfs-progs:

```
pacman -S btrfs-progs --noconfirm
```

### Baixar kernels (sua preferência):

```
pacman -S linux linux-headers ➜ Kernel Stable (default)
pacman -S linux-hardened linux-hardened-headers ➜ Kernel focado na segurança
pacman -S linux-lts linux-lts-headers ➜ Kernel a longo prazo
pacman -S linux-zen linux-zen-headers ➜ Kernel focado em desempenho
```

### Configurar pacman.conf:

```
nvim /etc/pacman.conf
Descomentar linhas: 
#multilib
#incluide
```

### Sincronizar repositórios:

```
pacman -Syy
```

### Senha root:

```
passwd
```

### Criar user:

```
Se você usa zsh você pode fazer assim:

pacman -S zsh --noconfirm

useradd -m -g users -s /bin/zsh user

Se você usa bash pode fazer assim:

useradd -m -g users -s /bin/bash user
```

### Criar senha para o user:

```
passwd USER
```

### Editar arquivo sudo:

```
nvim /etc/sudoers

Embaixo da linha:

root ALL=(ALL) ALL

Você adiciona seu user:

user ALL=(ALL) ALL

```

### Grub - UEFI

```
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub_Arch --recheck
```

### Caso se tiver outro sistema Linux e Windows:

```
pacman -S os-prober ntfs-3g --noconfirm
```

### Atualizar o arquivo do Grub:

```
grub-mkconfig -o /boot/grub/grub.cfg
```

# Reboota o sistema e tira a mída...

### Baixar AMD (antiga):

```
sudo pacman -S xf86-video-ati --noconfirm
```

### Baixar AMD (nova):

```
sudo pacman -S xf86-video-amdgpu --noconfirm
```

### Alternativa para o x.Org:

```
sudo pacman -S waylandy xorg-server-xwayland --noconfirm
```

### Baixar alguns pacotes:

```
sudo pacman -S xorg-server xorg-xinit pulseaudio-alsa pavucontrol ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono xclip usbutils wget --noconfirm
```

### Fontes para emojis:
```
sudo pacman -S ttf-joypixels (Fonte proprietária)

sudo pacman -S noto-fonts-emoji (Fonte Open Source)
```

### Script i3-gaps
```
wget -c https://github.com/ffraanks/i3-install/raw/master/i3-install && chmod +x i3-install && ./i3-install
```
