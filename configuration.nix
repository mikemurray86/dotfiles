# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mike = {
    isNormalUser = true;
    description = "mike";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "mike";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    docker
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      jellyfin = {
	image = "docker.io/jellyfin/jellyfin";
	autoStart = true;
	extraOptions = [
	  "--network=host"
	];
	volumes = [
	  "jellyfin-cache:/cache"
	  "/opt/jellyfin/config:/config"
	  "/opt/jellyfin/media:/media"
	];
      };
      owncloudServer = {
        image = "docker.io/owncloud/server";
        autoStart = true;
        ports = [ "8080:8080" ];
        extraOptions = [
	  "--network=host"
	];
        volumes = [
          "oc_files:/mnt/data"
        ];
        environment = {
	  OWNCLOUD_DB_TYPE = "mysql";
	  OWNCLOUD_DB_NAME = "owncloud";
	  OWNCLOUD_DB_USERNAME = "owncloud";
	  OWNCLOUD_DB_PASSWORD = "owncloud";
	  OWNCLOUD_DB_HOST = "127.0.0.1";
	  OWNCLOUD_MYSQL_UTF8MB4 = "true";
	  OWNCLOUD_REDIS_ENABLED = "true";
	  OWNCLOUD_REDIS_HOST= "127.0.0.1";
        };
      };
      owncloudDb = {
        image = "docker.io/mariadb:10.6";
        autoStart = true;
        ports = [ "3306:3306" ];
        extraOptions = [
	  "--network=host"
	];
        volumes = [
          "mysql_files:/var/lib/mysql"
        ];
        environment = {
	  MYSQL_ROOT_PASSWORD = "owncloud";
	  MYSQL_USER = "owncloud";
	  MYSQL_PASSWORD = "owncloud";
	  MYSQL_DATABASE = "owncloud";
	};
	cmd = [
	  "--max-allowed-packet=128M"
	  "--innodb-log-file-size=64M"
	];
      };
      owncloudRedis = {
        image = "docker.io/redis:6";
        autoStart = true;
        ports = [ "6379:6379" ];
        extraOptions = [
	  "--network=host"
	];
        volumes = [
          "redis_files:/data"
        ];
	cmd = [
	  "--databases"
	  "1"
	];
      };
    };
  };
}
