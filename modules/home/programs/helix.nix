{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    extraPackages = with pkgs; [
      #formatter
      nixfmt-rfc-style
      yamlfmt
      rust-bin.stable.latest.rustfmt

      #lsp
      dockerfile-language-server-nodejs
      docker-compose-language-service

      rust-bin.stable.latest.rust-analyzer

      taplo
      yaml-language-server
      markdown-oxide
      vscode-langservers-extracted

      bash-language-server

      ruff

      #debugger
      lldb_18
    ];

    settings = {
      editor = {
        line-number = "relative";

        lsp = {
          display-inlay-hints = true;
        };
      };
    };

    languages = {
      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
      };

      language = [
        {
          name = "nix";

          formatter.command = "nixfmt";
          auto-format = true;

          indent = {
            tab-width = 2;
            unit = "t";
          };
        }
        {
          name = "rust";

          formatter.command = "rustfmt";
          auto-format = true;
        }
        {
          name = "python";

          language-servers = [ "ruff" ];

          auto-format = true;
        }
        {
          name = "yaml";

          formatter = {
            command = "yamlfmt";
            args = [
              "-in"
              "-no_global_conf"
            ];
          };
          auto-format = true;
        }
        {
          name = "toml";

          formatter = {
            command = "taplo";
            args = [
              "fmt"
              "-"
            ];
          };
          auto-format = true;
        }
      ];
    };
  };
}
