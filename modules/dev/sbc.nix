{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        rpiboot # lets computer see raspberry pi cm storage over usb
        rpi-imager
        libusb1 # library for usb to see raspberry pi cm storage
    ];
    users.groups.dialout.members = [ "allthebeans" ]; #for flashing
}
