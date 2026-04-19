{ config, pkgs, ... }: {
  users.users.remotebuild = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$UGz9QqII.qZSA.zMm/gUe.$FYkgAKvaqS74PjnO5XLQQk6VgwH5Ky3UmMorYMNHjb2";
    description = "The user for doing remote builds";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHeBjHUYq2tW1WWHKN6S5io/qyflo0ssDJeBVF4wRne8 remote-builder" 
    ];
  };

  security.sudo.extraRules = [
    { users = [ "myusername" ];
      options = [ "NOPASSWD" ];
    }
  ];

}
