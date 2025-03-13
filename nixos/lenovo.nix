{ config, pkgs, lib, ... }:

{
  options.lenovo = {
    enable = lib.mkEnableOption "Lenovo Laptop + Battery Life Omp";
  };

  services.thermald.enable = true;

  # Don't ask about kernel stuff  
  boot.kernelParams = [
    "intel_pstate=passive"
    "pcie_aspm=force"
    "usbcore.autosuspend=1"
    "acpi_osi=Linux"
    "acpi_backlight=vendor"
    "mem_sleep_default=deep"
    "intel_idle.max_cstate=9"
    "rcu_nocbs=0-$(nproc)"
    "nmi_watchdog=0"
  ];

  hardware.bluetooth.enable = true;

  # Disable printing services
  services.printing.enable = false;

  services.fstrim.enable = true;

  systemd.sleep.extraConfig = ''
    SuspendState=mem
    HibernateState=disk
  '';

  boot.kernel.sysctl = {
    "vm.laptop_mode" = 10;
    "vm.dirty_writeback_centisecs" = 3000;
    "kernel.nmi_watchdog" = 0;
  };

  services.xserver.videoDrivers = [ "intel" ];
  
  # Intel-specific power-saving options
  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=1"
    "i915.enable_rc6=7"
  ];

  environment.systemPackages = with pkgs; [
    powertop
    acpi
    pciutils
    ethtool
    wayland-utils
    lm_sensors
  ];

  # Enable Lenovo battery optimization features
  lenovo.enable = true;
}
